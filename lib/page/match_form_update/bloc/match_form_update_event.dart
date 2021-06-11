
import 'package:equatable/equatable.dart';

class MatchFormUpdateEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadFormData extends MatchFormUpdateEvent {
  @override
  String toString() {
    return 'LoadFormData{}';
  }
}

class UpdateTeam extends MatchFormUpdateEvent {
  final String team;

  UpdateTeam(this.team);

  @override
  String toString() {
    return 'UpdateTeam{team: $team}';
  }
}

class UpdateTextYourTeam extends MatchFormUpdateEvent {
  final String team;

  UpdateTextYourTeam(this.team);

  @override
  String toString() {
    return 'UpdateTextYourTeam{team: $team}';
  }
}

class UpdateTextArena extends MatchFormUpdateEvent {
  final String arena;

  UpdateTextArena(this.arena);

  @override
  String toString() {
    return 'UpdateTextArena{arena: $arena}';
  }
}

class UpdateTextOpponentClub extends MatchFormUpdateEvent {
  final String opponentClub;

  UpdateTextOpponentClub(this.opponentClub);

  @override
  String toString() {
    return 'UpdateTextOpponentClub{opponentClub: $opponentClub}';
  }
}

class UpdateEnergyLevel extends MatchFormUpdateEvent {
  final double energyLevel;

  UpdateEnergyLevel(this.energyLevel);

  @override
  String toString() {
    return 'UpdateEnergyLevel{level: $energyLevel}';
  }
}

class UpdateSleep extends MatchFormUpdateEvent {
  final double sleepLevel;

  UpdateSleep(this.sleepLevel);

  @override
  String toString() {
    return 'UpdateSleep{sleepLevel: $sleepLevel}';
  }
}

class UpdateYourTeam extends MatchFormUpdateEvent {
  final String team;

  UpdateYourTeam(this.team);

  @override
  String toString() {
    return 'UpdateYourTeam{team: $team}';
  }
}

class UpdateTypeOfActivity extends MatchFormUpdateEvent {
  final double activityType;

  UpdateTypeOfActivity(this.activityType);

  @override
  String toString() {
    return 'UpdateActivityType{activityType: $activityType}';
  }
}

class UpdateEating extends MatchFormUpdateEvent {
  final double eating;

  UpdateEating(this.eating);

  @override
  String toString() {
    return 'UpdateEating{eating: $eating}';
  }
}

class UpdateDateTime extends MatchFormUpdateEvent {
  final DateTime dateTime;

  UpdateDateTime(this.dateTime);

  @override
  String toString() {
    return 'UpdateDateTime{dateTime: $dateTime}';
  }
}

class UpdateCountry extends MatchFormUpdateEvent {
  final String country;

  UpdateCountry(this.country);

  @override
  String toString() {
    return 'UpdateCountry{country: $country}';
  }
}

class UpdateTypeOfGame extends MatchFormUpdateEvent {
  final String typeOfGame;

  UpdateTypeOfGame(this.typeOfGame);

  @override
  String toString() {
    return 'UpdateTypeOfGame{typeOfGame: $typeOfGame}';
  }
}

class UpdateLengthTime extends MatchFormUpdateEvent {
  final String lengthTime;

  UpdateLengthTime(this.lengthTime);

  @override
  String toString() {
    return 'UpdateLengthTime{lengthTime: $lengthTime}';
  }
}

class UpdatePlace extends MatchFormUpdateEvent {
  final String place;

  UpdatePlace(this.place);

  @override
  String toString() {
    return 'UpdatePlace{place: $place}';
  }
}

class UpdatePhysically extends MatchFormUpdateEvent {
  final double physically;

  UpdatePhysically(this.physically);

  @override
  String toString() {
    return 'UpdatePhysically{physically: $physically}';
  }
}

class UpdateClub extends MatchFormUpdateEvent {
  final String club;

  UpdateClub(this.club);

  @override
  String toString() {
    return 'UpdateClub{club: $club}';
  }
}

class UpdateResult extends MatchFormUpdateEvent {
  final int yourTeam;
  final int opponent;
  final bool isYourTeamChangeScore;
  final bool isIncrease;

  UpdateResult(this.yourTeam, this.opponent, this.isYourTeamChangeScore,
      this.isIncrease);

  @override
  String toString() {
    return 'UpdateResult{yourTeam: $yourTeam, opponent: $opponent, isYourTeamChangeScore: $isYourTeamChangeScore, isIncrease: $isIncrease}';
  }
}

class PickMedia extends MatchFormUpdateEvent {
  final bool isPhoto;
  final bool isFromGallery;

  PickMedia(this.isPhoto, this.isFromGallery);

  @override
  String toString() {
    return 'PickMedia{isPhoto: $isPhoto, isFromGallery: $isFromGallery}';
  }
}


