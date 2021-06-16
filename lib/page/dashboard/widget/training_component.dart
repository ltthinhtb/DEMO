import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/service/model/total_value.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingComponent extends StatefulWidget {
  const TrainingComponent({Key? key}) : super(key: key);

  @override
  _TrainingComponentState createState() => _TrainingComponentState();
}

class _TrainingComponentState extends State<TrainingComponent> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    DashboardBloc _bloc = BlocProvider.of<DashboardBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          textIntroduce(),
          SizedBox(height: 14),
          buildMainColumn(_bloc)
        ],
      ),
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
          SizedBox(height: 15),
          buildChart(_bloc),
          SizedBox(height: 23),
          buildPieChart(_bloc),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.current.practice_tag,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: AppColor.grey),
            ),
          ),
          SizedBox(height: 16),
          buildWrapChoice(_bloc),
          SizedBox(height: 16),
          buildTable(_bloc),
          SizedBox(height: 20),
          Center(
            child: Text(S.current.training_update,style: Theme.of(context).textTheme.headline2),
          ),
          SizedBox(height: 20),
          buildTable(_bloc),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildChart(DashboardBloc _bloc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ExpandedSection(
        expand: isExpanded,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _bloc.totalData.dataStats!
              .map((e) => SizedBox(
                    height: 220,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            e.title ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColor.grey),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: e.yourValue! > 0,
                                  child: Text(
                                    "${73}h",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColor.grey),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Column(
                                  children: [
                                    IndexValue(value: 30, title: "T"),
                                    IndexValue(value: 23, title: "G"),
                                    IndexValue(value: 20, title: "P")
                                  ]
                                      .map((e) => Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                                color: AppColor.blue,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            width: 40,
                                            padding: EdgeInsets.symmetric(
                                                vertical: e.value! / 5),
                                            child: Text(
                                              e.title ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  S.current.you,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColor.blue),
                                )
                              ],
                            ),
                            SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: e.avgValue! > 0,
                                  child: Text(
                                    "${e.avgValue!.toInt()}h",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColor.grey),
                                  ),
                                ),
                                Column(
                                  children: e.indexValue!
                                      .map((e) => Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                                color: AppColor.grey,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            width: 40,
                                            padding: EdgeInsets.symmetric(
                                                vertical: e.value! / 5),
                                            child: Text(
                                              e.title ?? "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  S.current.avg,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: AppColor.grey),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buildPieChart(DashboardBloc _bloc) {
    List<PieStats> list = _bloc.totalData.pieStats ?? [];
    List<Color> listColor = [
      AppColor.green,
      AppColor.accentBlue,
      AppColor.purple,
      AppColor.blue
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list
            .map((e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          e.title ?? "",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColor.grey),
                        ),
                        SizedBox(height: 14),
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(PieChartData(
                              startDegreeOffset: 150,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 4,
                              sections: e.chart!
                                  .map((element) => PieChartSectionData(
                                      showTitle: false,
                                      color:
                                          listColor[e.chart!.indexOf(element)],
                                      title: element.chartItem,
                                      radius: 15,
                                      value: element.chartValue))
                                  .toList())),
                        ),
                        SizedBox(height: 16),
                        Column(
                          children: e.chart!
                              .map((element) => Padding(
                                    padding: EdgeInsets.only(bottom: 3),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${element.chartValue!.toInt()}%',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '${element.chartItem}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(
                                                  color: listColor[e.chart!
                                                      .indexOf(element)]),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget buildWrapChoice(DashboardBloc _bloc) {
    List<String> list = _bloc.listChoice;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List<Widget>.generate(
            list.length,
            (index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  decoration: BoxDecoration(
                    color: AppColor.blackGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(list[index]),
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
