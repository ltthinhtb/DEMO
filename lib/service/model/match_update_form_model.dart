// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
class MatchUpdateFormModel {
  double? energyLevel;
  double? sleepLevel;
  double? eatingLevel;
  double? typeOfActivity;
  String? dateTime;
  String? country;
  String? typeOfGame;
  String? lengthTime;
  String? place;
  String? club;
  String? yourTeam;
  String? opponentClub;
  String? opponentTeam;
  String? arena;
  Result? result;
  List<Goal>? goals;
  List<ActionPlayer>? actions;
  double? physically;
  double? teamPerformance;
  List<Player>? players;
  String? matchReview;

  MatchUpdateFormModel(
      {this.energyLevel,
      this.sleepLevel,
      this.eatingLevel,
      this.typeOfActivity,
      this.dateTime,
      this.country,
      this.typeOfGame,
      this.lengthTime,
      this.place,
      this.club,
      this.yourTeam,
      this.opponentClub,
      this.opponentTeam,
      this.arena,
      this.result,
      this.goals,
      this.actions,
      this.physically,
      this.teamPerformance,
      this.players,
      this.matchReview}) ;

  factory MatchUpdateFormModel.fromMap(Map<String, dynamic> json) =>
      MatchUpdateFormModel(
          energyLevel: json["energy_level"],
          sleepLevel: json["sleep_level"],
          eatingLevel: json["eating_level"],
          typeOfActivity: json["type_of_activity"],
          dateTime: json["dateTime"],
          country: json["country"],
          typeOfGame: json["type_of_game"],
          lengthTime: json["length_time"],
          place: json["place"],
          club: json["club"],
          yourTeam: json["your_team"],
          opponentClub: json["opponent_club"],
          opponentTeam: json["opponent_team"],
          arena: json["arena"],
          result: Result.fromMap(json["result"]),
          goals: List<Goal>.from(json["goals"].map((x) => Goal.fromMap(x))),
          actions: List<ActionPlayer>.from(
              json["actions"].map((x) => ActionPlayer.fromMap(x))),
          physically: json["physically"],
          teamPerformance: json['team_performance'],
          players:
              List<Player>.from(json['players'].map((x) => Player.fromJson(x))),
          matchReview: json['match_review']);

  Map<String, dynamic> toMap() => {
        "energy_level": energyLevel,
        "sleep_level": sleepLevel,
        "eating_level": eatingLevel,
        "type_of_activity": typeOfActivity,
        "dateTime": dateTime,
        "country": country,
        "type_of_game": typeOfGame,
        "length_time": lengthTime,
        "place": place,
        "club": club,
        "your_team": yourTeam,
        "opponent_club": opponentClub,
        "opponent_team": opponentTeam,
        "arena": arena,
        "result": result?.toMap(),
        "goals": List<dynamic>.from(goals!.map((x) => x.toMap())),
        "actions": List<dynamic>.from(actions!.map((x) => x.toMap())),
        "players": List<dynamic>.from(players!.map((x) => x.toJson())),
        "physically": physically,
        "team_performance": teamPerformance,
        "match_review": matchReview
      };
}

class ActionPlayer {
  ActionPlayer({
    this.minute,
    this.action,
    this.player,
  });

  int? minute;
  String? action;
  String? player;

  factory ActionPlayer.fromMap(Map<String, dynamic> json) => ActionPlayer(
        minute: json["minute"],
        action: json["action"],
        player: json["player"],
      );

  Map<String, dynamic> toMap() => {
        "minute": minute,
        "action": action,
        "player": player,
      };
}

class Goal {
  Goal({
    this.minute,
    this.goalsocrer,
    this.assist,
  });

  int? minute;
  String? goalsocrer;
  String? assist;

  factory Goal.fromMap(Map<String, dynamic> json) => Goal(
        minute: json["minute"],
        goalsocrer: json["goalsocrer"],
        assist: json["assist"],
      );

  Map<String, dynamic> toMap() => {
        "minute": minute,
        "goalsocrer": goalsocrer,
        "assist": assist,
      };
}

class Result {
  Result({
    this.yourTeamScore,
    this.opponentScore,
  });

  int? yourTeamScore;
  int? opponentScore;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        yourTeamScore: json["your_team_score"],
        opponentScore: json["opponent_score"],
      );

  Map<String, dynamic> toMap() => {
        "your_team_score": yourTeamScore,
        "opponent_score": opponentScore,
      };
}

class Player {
  String? name;
  String? role;
  String? avatar;
  double? rating;

  Player({this.name, this.role, this.avatar, this.rating});

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    return data;
  }
}
