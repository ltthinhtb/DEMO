import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/service/model/news_feed.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchComponent extends StatefulWidget {
  const MatchComponent({Key? key}) : super(key: key);

  @override
  _MatchComponentState createState() => _MatchComponentState();
}

class _MatchComponentState extends State<MatchComponent> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    DashboardBloc _bloc = BlocProvider.of<DashboardBloc>(context);
    return Column(
      children: [
        SizedBox(height: 20),
        textIntroduce(),
        SizedBox(height: 20),
        buildMainColumn(_bloc),
        SizedBox(height: 20),
      ],
    );
  }

  Widget textIntroduce() {
    return Column(
      children: [
        Center(
          child: Text(
            'Better and better',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: AppColor.greenAccent),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "+3h",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.greenAccent)),
                TextSpan(
                    text: " in the last 7 days, is ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.grey)),
                TextSpan(
                    text: "+10%",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.greenAccent)),
                TextSpan(
                    text: " than your average and ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.grey)),
                TextSpan(
                    text: "+20%",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.greenAccent)),
                TextSpan(
                    text: " than your peers.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.grey)),
              ]),
            ),
          ),
        )
      ],
    );
  }

  Widget buildMainColumn(DashboardBloc _bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.darkPrimary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(_bloc.totalData.time ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.greenAccent)),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Icon(Icons.sort))
              ],
            ),
          ),
          SizedBox(height: 20),
          buildGraph(),
          SizedBox(height: 40),
          buildChoiceStats(),
          SizedBox(height: 20),
          buildTable(_bloc),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildGraph() {
    List<Color> listColor = [AppColor.grey, AppColor.blue];
    var data = GraphMatch(graphData: [
      GraphData(title: "Average", value: [
        Value(value: -5, time: 0),
        Value(time: 1, value: 5),
        Value(time: 2, value: -2),
        Value(time: 3, value: -5),
        Value(time: 4, value: -2),
        Value(time: 5, value: 4),
        Value(time: 6, value: 5),
      ]),
      GraphData(title: "You", value: [
        Value(value: 1, time: 0),
        Value(time: 1, value: -3),
        Value(time: 2, value: -4),
        Value(time: 3, value: -6),
        Value(time: 4, value: -4),
        Value(time: 5, value: -4),
        Value(time: 6, value: -1),
      ]),
    ]);

    return ExpandedSection(
      expand: isExpanded,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: LineChart(LineChartData(
                  titlesData: FlTitlesData(show: false),
                  lineTouchData: LineTouchData(enabled: false),
                  minY: -6,
                  maxY: 6,
                  borderData: FlBorderData(show: false),
                  gridData:
                      FlGridData(checkToShowHorizontalLine: (double value) {
                    if (value == 0)
                      return true;
                    else
                      return false;
                  }),
                  lineBarsData: List<LineChartBarData>.generate(
                      data.graphData!.length, (int index) {
                    return LineChartBarData(
                        barWidth: 4,
                        colors: [listColor[index]],
                        spots: List<FlSpot>.generate(
                            data.graphData![index].value!.length, (int i) {
                          return FlSpot(
                              data.graphData![index].value![i].time ?? 0,
                              data.graphData![index].value![i].value ?? 0);
                        }));
                  }))),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: data.graphData!
                  .map((e) => Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: listColor[data.graphData!.indexOf(e)]),
                            ),
                            Text(
                              e.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: listColor[
                                          data.graphData!.indexOf(e)]),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildChoiceStats() {
    List<MatchStats> list = [
      MatchStats(stats: "Played/Start/Repl.", value: "24/23/1"),
      MatchStats(stats: "Played/Start", value: "24/23/1"),
      MatchStats(stats: "Goals/Assists", value: "13/6"),
      MatchStats(stats: "Played/Start/Repl.", value: "24/23/1"),
      MatchStats(stats: "Played/Start", value: "24/23/1"),
      MatchStats(stats: "Goals/Assists", value: "13/6"),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        runSpacing: 12,
        spacing: 12,
        children: List<Widget>.generate(
            list.length,
            (index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.blackGrey),
                  child: Column(
                    children: [
                      Text(
                        list[index].stats ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColor.grey),
                      ),
                      Text(list[index].value ?? "",
                          style: Theme.of(context).textTheme.bodyText1)
                    ],
                  ),
                )),
      ),
    );
  }

  Widget buildTable(DashboardBloc _bloc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DataTable(
        headingTextStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: AppColor.grey),
        dataTextStyle: Theme.of(context).textTheme.bodyText1,
        horizontalMargin: 0,
        columnSpacing: 20,
        columns: [
          DataColumn(label: Text('Type'), onSort: (index, value) {}),
          DataColumn(label: Text('Ses.')),
          DataColumn(label: Text('Avg.')),
          DataColumn(label: Text('Hour.')),
          DataColumn(label: Text('Avg.')),
        ],
        rows: _bloc.listPractice
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.type ?? "")),
                  DataCell(Text(e.sec!.toInt().toString())),
                  DataCell(Text(e.secAvg!.toInt().toString())),
                  DataCell(Text(e.hour!.toInt().toString())),
                  DataCell(Text(e.hourAvg!.toInt().toString()))
                ]))
            .toList(),
      ),
    );
  }
}
