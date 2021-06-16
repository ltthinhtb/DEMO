import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/service/model/total_value.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalComponent extends StatefulWidget {
  const TotalComponent({Key? key}) : super(key: key);

  @override
  _TotalComponentState createState() => _TotalComponentState();
}

class _TotalComponentState extends State<TotalComponent> {
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
            'Good work',
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
                    text: "You’ve updated your diary,",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.grey)),
                TextSpan(
                    text: " 3 of 4 ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.greenAccent)),
                TextSpan(
                    text:
                        "last days now. Contingency and disciplin is very important.",
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
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildChart(DashboardBloc _bloc){
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
                            "${e.yourValue!.toInt()}h",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: AppColor.grey),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: e.yourValue! * 4,
                          width: 40,
                          decoration: BoxDecoration(
                              color: AppColor.blue,
                              borderRadius:
                              BorderRadius.circular(3)),
                        ),
                        SizedBox(height: 5),
                        Text(
                          S.current.you,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              color: AppColor.blue),
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
                            margin:
                            EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: AppColor.grey,
                                borderRadius:
                                BorderRadius.circular(
                                    3)),
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
                              .copyWith(
                              color: AppColor.grey),
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
}
