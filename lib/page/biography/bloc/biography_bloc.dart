import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/service/model/biography_model.dart';
import 'package:bloc_example/service/model/media_file.dart';
import 'package:bloc_example/service/model/raw_data_set.dart';
import 'package:bloc_example/service/repository/biography_repository.dart';
import 'package:bloc_example/util/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'biography_event.dart';

part 'biography_state.dart';

class BiographyBloc extends Bloc<BiographyEvent, BiographyState> {
  BiographyBloc() : super(BiographyInitial()) {
    add(BiographyGetData());
  }

  BiographyModel biographyModel = BiographyModel();
  BiographyRepository _repository = BiographyRepository();
  List<Media> listMedia = [];
  List<RawDataSet> listRaw = [];

  @override
  Stream<BiographyState> mapEventToState(
    BiographyEvent event,
  ) async* {
    if (event is BiographyEvent) {
      yield BiographyLoading();
      biographyModel = await _repository.getBiography();
      listRaw = await _repository.getDataSet();
      yield BiographyLoaded();
    }
    if (event is UploadVideo) {
      yield BiographyLoading();
      var pickedFile;
      ImageSource source =
          event.isCamera ? ImageSource.camera : ImageSource.gallery;
      try {
        pickedFile = await ImagePicker().getVideo(source: source);
        if (pickedFile != null) {
          listMedia.add(Media(File(pickedFile.path), MediaFile.video));
          yield BiographyLoaded();
        } else
          return;
      } catch (e) {
        logger.e(e);
      }
    }
  }
}
