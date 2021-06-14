import 'package:bloc_example/service/model/total_value.dart';

class DashBoardRepository {
  Future<TotalData> getTotalData() async {
    return TotalData(time: "2021 - Last 7 days", dataStats: [
      DataStats(title: "Trainings", avgValue: 163, yourValue: 1, indexValue: [
        IndexValue(title: "T", value: 70),
        IndexValue(title: "G", value: 53),
        IndexValue(title: "P", value: 40),
      ]),
      DataStats(title: "Matches", avgValue: 147, yourValue: 0, indexValue: [
        IndexValue(title: "S", value: 60),
        IndexValue(title: "C", value: 50),
        IndexValue(title: "F", value: 37),
      ]),
      DataStats(title: "Total", avgValue: 147, yourValue: 1, indexValue: [
        IndexValue(title: "T", value: 100),
        IndexValue(title: "G", value: 47),
      ])
    ], pieStats: [
      PieStats(title: "Training category", chart: [
        Chart(chartItem: 'Technical', chartValue: 45),
        Chart(chartItem: 'Tactital', chartValue: 30),
        Chart(chartItem: 'Mental', chartValue: 10),
        Chart(chartItem: 'Physical', chartValue: 15),
      ]),
      PieStats(title: "Match resoults", chart: [
        Chart(chartItem: 'Wins', chartValue: 45),
        Chart(chartItem: 'Draws', chartValue: 40),
        Chart(chartItem: 'Losses', chartValue: 15),
      ]),
      PieStats(title: "Day usage", chart: [
        Chart(chartItem: 'Training', chartValue: 45),
        Chart(chartItem: 'Match', chartValue: 30),
        Chart(chartItem: 'Rest', chartValue: 20),
        Chart(chartItem: 'Injured', chartValue: 5),
      ])
    ]);
  }
}
