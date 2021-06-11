import 'package:bloc_example/service/model/match_update_form_model.dart';

class MatchUpdateFormRepository {
  Future<MatchUpdateFormModel> getFormData() async {
    return MatchUpdateFormModel(
        arena: "Alianz Arena, Muchen",
        club: "Maj Fc",
        country: "Sweden",
        dateTime: "2021-01-12 14:23",
        eatingLevel: 3 / 4,
        energyLevel: 3 / 4,
        lengthTime: "90 min",
        opponentClub: "Bayer",
        opponentTeam: "P07A",
        physically: 3 / 4,
        place: "Home",
        result: Result(opponentScore: 0, yourTeamScore: 3),
        sleepLevel: 1 / 4,
        typeOfActivity: 5 / 5,
        typeOfGame: "League game",
        yourTeam: "P07",
        teamPerformance: 3.5,
        players: [
          Player(
              name: "#ZportID",
              avatar:
                  "https://nld.mediacdn.vn/2018/5/25/ronaldinho-barcelona-20071pqxctg9762y11ly24wvgsq5nf-15272392547141500534126.jpg",
              rating: 3.5,
              role: "role"),
          Player(
              name: "#Messi",
              avatar:
                  "https://cdn-img.thethao247.vn/storage/files/cuongnm/2021/06/03/messi-2-1622683347.jpeg",
              rating: 3.5,
              role: "striker"),
          Player(
              avatar:
                  "https://vcdn-thethao.vnecdn.net/2021/05/21/ronaldo-jpeg-1621563145-4035-1621563301.jpg",
              name: "Ronaldo",
              rating: 4,
              role: "defender"),
        ],
        goals: [
          Goal(minute: 18, assist: "Leo Messi", goalsocrer: "Neo Jonhson"),
          Goal(minute: 21, assist: "Leo Messi", goalsocrer: "Neo Jonhson")
        ],
        actions: [
          ActionPlayer(minute: 18, action: "Yellow Card", player: "Leo Messi"),
          ActionPlayer(minute: 18, action: "Red Card", player: "Leo Messi"),
        ],
        matchReview: "");
  }

  Future<List<String>> getTeam() async {
    return ['Liverpool', 'MU', 'P07'];
  }

  Future<List<String>> getEnergyLevel() async {
    return ["Very bad", "Bad", "Normal", "Good", "Very Good"];
  }

  Future<List<String>> getSleepLevel() async {
    return ["Very bad", "Bad", "Normal", "Good", "Very Good"];
  }

  Future<List<String>> getTypeOfActivityLevel() async {
    return [
      "No football today!",
      "Other",
      "Gym",
      "Personal Trainer",
      "Team Training",
      "Match"
    ];
  }

  Future<List<String>> getEatingLevel() async {
    return ["Very bad", "Bad", "Normal", "Good", "Very Good"];
  }

  Future<List<String>> getPhysicallyLevel() async {
    return ["Very low", "Low", "Normal", "High", "Very High"];
  }

  Future<List<String>> getTypeOfGame() async {
    return ['League game', 'Quick Match'];
  }

  Future<List<String>> getLengthTime() async {
    return ["90 min", "45 min"];
  }

  Future<List<String>> getPlace() async {
    return ["Home", "Stadium"];
  }

  Future<List<String>> getClub() async {
    return ['Maj Fc', 'MU'];
  }

  Future<List<String>> getCountry() async {
    return ["Việt Nam", "Lào", "Sweden"];
  }
}
