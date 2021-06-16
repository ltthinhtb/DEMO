part of 'biography_bloc.dart';

@immutable
abstract class BiographyEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class BiographyGetData extends BiographyEvent {}

class UploadVideo extends BiographyEvent{
  final bool isCamera;

  UploadVideo(this.isCamera);
}
