import 'dart:io';

import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/service/model/media_file.dart';
import 'package:bloc_example/util/const.dart';
import 'package:bloc_example/util/logger.dart';
import 'package:bloc_example/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'match_form_update.dart';
import 'package:bloc_example/service/model/match_update_form_model.dart';
import 'package:bloc_example/service/repository/match_update_form_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchFormUpdateBloc
    extends Bloc<MatchFormUpdateEvent, MatchFormUpdateState> {
  MatchFormUpdateBloc() : super(MatchFormUpdateInitial()) {
    add(LoadFormData());
  }


  MatchUpdateFormRepository repository = MatchUpdateFormRepository();
  List<String> listTeam = [];
  List<String> listEnergyLevel = [];
  List<String> listEatingLevel = [];
  List<String> listSleepLevel = [];
  List<String> listTypeOfActivityLevel = [];
  List<String> listTypeOfGame = [];
  List<String> listLengthTime = [];
  List<String> listPlace = [];
  List<String> listClub = [];
  List<String> listPhysicallyLevel = [];
  List<String> listCountry = [];
  List<Goal> listGoal = [];
  List<ActionPlayer> listAction = [];
  List<Player> listPlayer = [];
  List<Media> listMedia = [];

  TextEditingController timeController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController opponentClubController = TextEditingController();
  TextEditingController arenaController = TextEditingController();
  TextEditingController yourTeamScoreController = TextEditingController();
  TextEditingController opponentScoreController = TextEditingController();
  TextEditingController matchReviewController = TextEditingController();

  String errorYourTeam = "";
  String errorOpponentClub = "";
  String errorArena = "";
  String errorTime = "";
  MatchUpdateFormModel matchUpdateFormModel = MatchUpdateFormModel();

  @override
  Stream<MatchFormUpdateState> mapEventToState(
      MatchFormUpdateEvent event) async* {
    if (event is LoadFormData) {
      yield MatchFormUpdateLoading();
      await _updateValue();
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateYourTeam) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.yourTeam = event.team;
      yield MatchFormUpdateLoaded();
    }

    if (event is UpdateTextYourTeam) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.yourTeam = event.team;
      if (event.team.isEmpty) {
        S.current.body_image;
        errorYourTeam = S.current.please_input_your_team;
        yield ValidatorUpdateFormError(errorYourTeam);
      } else {
        errorYourTeam = "";
        yield MatchFormUpdateLoaded();
      }
    }

    if (event is UpdateTextOpponentClub) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.opponentClub = event.opponentClub;
      if (event.opponentClub.isEmpty) {
        errorOpponentClub = S.current.please_input_opponent_club;
        yield ValidatorUpdateFormError(errorOpponentClub);
      } else {
        errorOpponentClub = "";
        yield MatchFormUpdateLoaded();
      }
    }

    if (event is UpdateTextArena) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.arena = event.arena;
      if (event.arena.isEmpty) {
        errorArena = S.current.please_input_arena;
        yield ValidatorUpdateFormError(errorArena);
      } else {
        errorArena = "";
        yield MatchFormUpdateLoaded();
      }
    }

    if (event is UpdateEnergyLevel) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.energyLevel = event.energyLevel;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateSleep) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.sleepLevel = event.sleepLevel;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateEating) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.eatingLevel = event.eating;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateTypeOfActivity) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.typeOfActivity = event.activityType;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateCountry) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.country = event.country;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateTypeOfGame) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.typeOfGame = event.typeOfGame;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateLengthTime) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.lengthTime = event.lengthTime;
      yield MatchFormUpdateLoaded();
    }

    if (event is UpdatePlace) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.place = event.place;
      yield MatchFormUpdateLoaded();
    }

    if (event is UpdateClub) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.club = event.club;
      yield MatchFormUpdateLoaded();
    }
    if (event is UpdateResult) {}
    if (event is UpdatePhysically) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.physically = event.physically;
      yield MatchFormUpdateLoaded();
    }
    if (event is PickMedia) {
      yield MatchFormUpdateLoading();
      var pickedFile;
      ImageSource source =
          event.isFromGallery ? ImageSource.gallery : ImageSource.camera;
      try {
        pickedFile = event.isPhoto
            ? await ImagePicker().getImage(source: source)
            : await ImagePicker().getVideo(source: source);
        if (pickedFile != null) {
          listMedia.add(Media(File(pickedFile.path),
              event.isPhoto ? MediaFile.image : MediaFile.video));
          yield MatchFormUpdateLoaded();
        } else
          return;
      } catch (e) {
        logger.e(e);
      }
    }

    if (event is UpdateDateTime) {
      yield MatchFormUpdateLoading();
      matchUpdateFormModel.dateTime =
          Utils.parseDateToString(event.dateTime, Const.TIME_FULL_DAY);
      timeController.text =
          matchUpdateFormModel.dateTime ?? DateTime.now().toString();
      yield MatchFormUpdateLoaded();
    }
  }

  Future<void> _updateValue() async {
     matchUpdateFormModel = await repository.getFormData();
    listTeam = await repository.getTeam();
    listEnergyLevel = await repository.getEnergyLevel();
    listEatingLevel = await repository.getEatingLevel();
    listSleepLevel = await repository.getSleepLevel();
    listTypeOfActivityLevel = await repository.getTypeOfActivityLevel();
    listTypeOfGame = await repository.getTypeOfGame();
    listLengthTime = await repository.getLengthTime();
    listPlace = await repository.getPlace();
    listClub = await repository.getClub();
    listCountry = await repository.getCountry();
    listGoal = matchUpdateFormModel.goals!;
    listAction = matchUpdateFormModel.actions!;
    listPlayer = matchUpdateFormModel.players!;
    listPhysicallyLevel = await repository.getPhysicallyLevel();
    timeController.text =
        matchUpdateFormModel.dateTime ?? DateTime.now().toString();
    teamController.text = matchUpdateFormModel.yourTeam ?? "";
    opponentClubController.text = matchUpdateFormModel.opponentClub ?? "";
    arenaController.text = matchUpdateFormModel.arena ?? "";
    yourTeamScoreController.text =
        matchUpdateFormModel.result!.yourTeamScore.toString();
    opponentScoreController.text =
        matchUpdateFormModel.result!.opponentScore.toString();
    matchReviewController.text = matchUpdateFormModel.matchReview!;
  }
}
