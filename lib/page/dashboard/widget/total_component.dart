import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalComponent extends StatefulWidget {
  const TotalComponent({Key? key}) : super(key: key);

  @override
  _TotalComponentState createState() => _TotalComponentState();
}

class _TotalComponentState extends State<TotalComponent> {
  @override
  Widget build(BuildContext context) {
    DashboardBloc _bloc = BlocProvider.of<DashboardBloc>(context);

    return Column(
      children: [
        SizedBox(height: 18),
        textIntroduce(),
        SizedBox(height: 14),
        buildChartColumn(_bloc)
      ],
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
        ),
      ],
    );
  }

  Widget buildChartColumn(DashboardBloc _bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.darkPrimary,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(_bloc.totalData.time ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColor.greenAccent)),
              ),
              Icon(Icons.sort)
            ],
          ),
          SizedBox(height: 23),
          Row(
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
                                        color: AppColor.accentBlue,
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    S.current.you,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColor.accentBlue),
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
                                        borderRadius: BorderRadius.circular(3)
                                      ),
                                      width: 40,
                                      padding: EdgeInsets.symmetric(vertical: e.value!/5),
                                      child: Text(e.title ?? "",style: Theme.of(context).textTheme.bodyText1,),
                                    ))
                                        .toList(),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    S.current.avg,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColor.accentBlue),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
