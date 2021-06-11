import 'package:bloc_example/service/model/match_update_form_model.dart';
import 'package:bloc_example/service/model/news_feed.dart';

class FeedRepository {
  Future<List<Player>> getListPlayer() async {
    return [
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
    ];
  }

  Future<List<NewsFeed>> getNewsFeed() async {
    return [
      NewsFeed(
          address: "SE/Stockholm/2007",
          timeAgo: "15 min",
          userName: "Tiam Nobari",
          userAvatar:
              "https://www.biography.com/.image/t_share/MTU2MTQ4NTAyNjM4ODk2NTEz/lionel-messi.jpg",
          data: [
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing. Donec in dui dapibus, blandit nibh eget, molestie nunc.",
                training: Training(
                    timeTraning: "2020/01/31 18:00 - 19:45",
                    totalTime: "1h 45min",
                    chart: [
                      Chart(chartItem: "Mental", percent: 20.0, time: "31m"),
                      Chart(chartItem: "Physical", percent: 15.0, time: "31m"),
                      Chart(chartItem: "Technical", percent: 15.0, time: "15m"),
                      Chart(chartItem: "Tactical", percent: 50.0, time: "51m"),
                    ]),
                type: "training"),
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Injury description  ipsum dolor sit amet, consectetur adipiscing. Donec in dui dapibus.",
                training: Training(
                    timeTraning: "2020/01/31 18:00 - 19:45",
                    totalTime: "1h 45min",
                    chart: [
                      Chart(chartItem: "Mental", percent: 20.0, time: "31m"),
                      Chart(chartItem: "Physical", percent: 15.0, time: "31m"),
                      Chart(chartItem: "Technical", percent: 15.0, time: "15m"),
                      Chart(chartItem: "Tactical", percent: 50.0, time: "51m"),
                    ]),
                type: "training"),
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Consectetur adipiscing. Donec in dui dapibus, blandit nibh eget, molestie nunc.",
                training: Training(
                    timeTraning: "2020/01/31 18:00 - 19:45",
                    totalTime: "1h 45min",
                    chart: [
                      Chart(chartItem: "Mental", percent: 20.0, time: "31m"),
                      Chart(chartItem: "Physical", percent: 15.0, time: "31m"),
                      Chart(chartItem: "Technical", percent: 15.0, time: "15m"),
                      Chart(chartItem: "Tactical", percent: 50.0, time: "51m"),
                    ]),
                type: "training")
          ]),
      NewsFeed(
          address: "SE/Stockholm/2007",
          timeAgo: "15 min",
          userName: "Ronnie Ronaldinho",
          userAvatar:
              "https://cdnmedia.thethaovanhoa.vn/Upload/OWfOkd9XEN4OJqEXbaTxg/files/2018/01/2/5555/ronaldinho3.png",
          data: [
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing. Donec in dui dapibus, blandit nibh eget, molestie nunc.",
                type: "match",
                match: Match(
                    dateTime: "01/12 18:00",
                    season: "League game, Camp Nou",
                    team1: Team(
                        score: 2,
                        teamClub: "FC Barcelona",
                        teamLogo:
                            "https://upload.wikimedia.org/wikipedia/vi/thumb/9/91/FC_Barcelona_logo.svg/1200px-FC_Barcelona_logo.svg.png"),
                    team2: Team(
                        teamClub: "Liverpool FC",
                        score: 2,
                        teamLogo:
                            "https://upload.wikimedia.org/wikipedia/vi/thumb/0/0c/Liverpool_FC.svg/1200px-Liverpool_FC.svg.png"),
                matchStats: [
                  MatchStats(
                    value: "90/90m",
                    stats: "Min"
                  ),

                  MatchStats(
                      value: "CDM",
                      stats: "Role"
                  ),
                  MatchStats(
                      value: "2/0",
                      stats: "Goals/Ass"
                  ),
                  MatchStats(
                      value: "Yellow/Red",
                      stats: "0/0"
                  ),
                ])),
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Injury description  ipsum dolor sit amet, consectetur adipiscing. Donec in dui dapibus.",
                training: Training(
                    timeTraning: "2020/01/31 18:00 - 19:45",
                    totalTime: "1h 45min",
                    chart: [
                      Chart(chartItem: "Mental", percent: 20.0, time: "31m"),
                      Chart(chartItem: "Physical", percent: 15.0, time: "31m"),
                      Chart(chartItem: "Technical", percent: 15.0, time: "15m"),
                      Chart(chartItem: "Tactical", percent: 50.0, time: "51m"),
                    ]),
                type: "training"),
            News(
                comment: 15,
                feeling: 48,
                describe:
                    "Consectetur adipiscing. Donec in dui dapibus, blandit nibh eget, molestie nunc.",
                training: Training(
                    timeTraning: "2020/01/31 18:00 - 19:45",
                    totalTime: "1h 45min",
                    chart: [
                      Chart(chartItem: "Mental", percent: 20.0, time: "31m"),
                      Chart(chartItem: "Physical", percent: 15.0, time: "31m"),
                      Chart(chartItem: "Technical", percent: 15.0, time: "15m"),
                      Chart(chartItem: "Tactical", percent: 50.0, time: "51m"),
                    ]),
                type: "training")
          ]),
    ];
  }
}
