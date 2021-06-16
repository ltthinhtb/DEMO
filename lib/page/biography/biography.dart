import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/global/widget/radar_chart.dart';
import 'package:bloc_example/global/widget/video_component.dart';
import 'package:bloc_example/page/biography/bloc/biography_bloc.dart';
import 'package:bloc_example/service/model/media_file.dart';
import 'package:bloc_example/service/model/news_feed.dart';
import 'package:bloc_example/service/model/raw_data_set.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/theme/image.dart';
import 'package:bloc_example/util/const.dart';
import 'package:bloc_example/util/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Biography extends StatefulWidget {
  const Biography({Key? key}) : super(key: key);

  @override
  _BiographyState createState() => _BiographyState();
}

class _BiographyState extends State<Biography> {
  bool isExpandedStats = true;
  bool isExpandedVideo = true;
  bool isExpandedTactic = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BiographyBloc();
      },
      child: BlocBuilder<BiographyBloc, BiographyState>(
        builder: (context, state) {
          BiographyBloc _bloc = context.read<BiographyBloc>();
          return Scaffold(
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainColumn(_bloc),
                SizedBox(height: 35),
                buildIntroduce(_bloc),
                SizedBox(height: 20),
                buildTab(_bloc),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('STATS',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColor.grey)),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedStats = !isExpandedStats;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColor.grey,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 14),
                ExpandedSection(
                  child: buildChoiceStats(),
                  expand: isExpandedStats,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Top Videos',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColor.grey)),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedVideo = !isExpandedVideo;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColor.grey,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buildMedia(_bloc),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Coach Profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColor.grey)),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpandedTactic = !isExpandedTactic;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColor.grey,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                buildChartRadar(_bloc)
              ],
            )),
          );
        },
      ),
    );
  }

  RichText buildName(BiographyBloc _bloc) {
    var listColorName = [AppColor.greenAccent, AppColor.white];
    String name = _bloc.biographyModel.name ?? "";
    return RichText(
        text: TextSpan(
            children: name
                .split(" ")
                .map((e) => TextSpan(
                    text: '$e ',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: listColorName[name.split(" ").indexOf(e)])))
                .toList()));
  }

  Widget buildProfile(BiographyBloc _bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(_bloc.biographyModel.position ?? "",
                style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 2),
              child: Text('${S.current.position}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
            SizedBox(height: 25),
            Image.network(
              _bloc.biographyModel.clubLogo ?? placeholder,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 2),
              child: Text('2021/11',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(_bloc.biographyModel.education ?? "",
                  style: Theme.of(context).textTheme.headline1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 2),
              child: Text('${S.current.education}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
          ],
        ),
        CircularPercentIndicator(
          radius: 190,
          lineWidth: 5.0,
          percent: 0.75,
          backgroundColor: AppColor.grey,
          progressColor: AppColor.blue,
          center: Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: CachedNetworkImageProvider(
                    _bloc.biographyModel.avatar ?? placeholder,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 2 / 3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingBar(
                      initialRating: 3.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      ratingWidget: RatingWidget(
                        full: Icon(
                          Icons.star,
                          color: AppColor.greenAccent,
                        ),
                        half: Icon(
                          Icons.star_half_outlined,
                          color: AppColor.greenAccent,
                        ),
                        empty: Icon(
                          Icons.star_border,
                          color: AppColor.greenAccent,
                        ),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 0),
                      onRatingUpdate: (rating) {
                        return;
                      },
                      tapOnlyMode: true,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "75%",
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${_bloc.biographyModel.age}",
                style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 2),
              child: Text('${S.current.age}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
            SizedBox(height: 25),
            Image.network(
              _bloc.biographyModel.countryLogo ?? "",
              height: 40,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, top: 2),
              child: Text('68/03/05',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(_bloc.biographyModel.level ?? "",
                  style: Theme.of(context).textTheme.headline1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, top: 2),
              child: Text('${S.current.level}',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColor.grey)),
            ),
          ],
        ),
      ],
    );
  }

  Widget mainColumn(BiographyBloc _bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.blackGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: 10),
          Center(
              child: Text(
            Utils.parseDateToString(DateTime.now(), Const.TIME_FULL_DAY),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColor.grey),
          )),
          SizedBox(height: 2),
          buildName(_bloc),
          SizedBox(height: 2),
          Center(
              child: Text(
            _bloc.biographyModel.nickName ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColor.grey),
          )),
          SizedBox(height: 35),
          buildProfile(_bloc),
        ],
      ),
    );
  }

  Widget buildIntroduce(BiographyBloc _bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColor.blackGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_alt_outlined,
                    color: AppColor.grey,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bloc.biographyModel.friends.toString(),
                          style: Theme.of(context).textTheme.headline2),
                      Text(S.current.friends,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColor.grey))
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite_border_outlined,
                    color: AppColor.grey,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bloc.biographyModel.fans.toString(),
                          style: Theme.of(context).textTheme.headline2),
                      Text(S.current.fans,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColor.grey))
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColor.grey,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bloc.biographyModel.follow.toString(),
                          style: Theme.of(context).textTheme.headline2),
                      Text(S.current.follow,
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: AppColor.grey))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Text(_bloc.biographyModel.introduce ?? "",
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildTab(BiographyBloc _bloc) {
    List<String> tabs = ["Future", "Total", "20/19", "19/18", "18/17", "17/16"];
    return DefaultTabController(
      length: tabs.length,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: TabBar(
            onTap: (int _index) {
              print(_index);
            },
            isScrollable: true,
            indicatorColor: AppColor.yellow,
            tabs: tabs
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        e,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: AppColor.grey),
                      ),
                    ))
                .toList()),
      ),
    );
  }

  Widget buildChoiceStats() {
    List<MatchStats> list = [
      MatchStats(stats: "Sessions", value: "43"),
      MatchStats(stats: "Trainings", value: "33"),
      MatchStats(stats: "Games", value: "10"),
      MatchStats(stats: "Av. Points", value: "1,6"),
      MatchStats(stats: "+/-", value: "13/6"),
      MatchStats(stats: "T/A", value: "1/2"),
      MatchStats(stats: "Role", value: "CAM"),
      MatchStats(stats: "Index", value: "87%"),
      MatchStats(stats: "P/C", value: "4/7"),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        runSpacing: 8,
        spacing: 6,
        children: List<Widget>.generate(
            list.length,
            (index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 6),
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

  Widget buildMedia(BiographyBloc _bloc) {
    return ExpandedSection(
      expand: isExpandedVideo,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            ..._bloc.listMedia
                .map((e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                          width:
                              (MediaQuery.of(context).size.width - 30 - 8) / 2,
                          child: e.type == MediaFile.image
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(
                                    e.file,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : VideoPlayerComponent(file: e.file),
                        ),
                      ],
                    ))
                .toList(),
            GestureDetector(
              onTap: () => _showDialog(context, _bloc),
              child: Container(
                alignment: Alignment.center,
                height: 120,
                width: (MediaQuery.of(context).size.width - 30 - 8) / 2,
                decoration: BoxDecoration(
                    color: AppColor.blackGrey,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_a_photo_outlined),
                    Text(
                      S.current.add_photo,
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, BiographyBloc _bloc) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(S.of(context).upload_media),
            actions: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(S.of(context).gallery),
                    onPressed: () {
                      _bloc.add(UploadVideo(false));
                      Navigator.pop(context);
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(S.of(context).camera),
                    onPressed: () {
                      _bloc.add(UploadVideo(true));
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  Widget buildChartRadio(BiographyBloc _bloc) {
    List<RawDataSet> list = _bloc.listRaw;
    return Visibility(
      visible: list.isNotEmpty,
      child: AspectRatio(
        aspectRatio: 1.3,
        child: RadarChart(
          RadarChartData(
              getTitle: (int value) {
                if (value == 0) {
                  return "Attacking";
                }
                if (value == 1) {
                  return "TURNOVERs";
                }
                if (value == 2) {
                  return "ANALYTICS";
                }
                if (value == 3) {
                  return "Defending";
                }
                if (value == 4) {
                  return "Player DEv.";
                } else
                  return "SET PIECES";
              },
              radarBackgroundColor: Color(0xff4150FB).withOpacity(0.5),
              tickBorderData: BorderSide(width: 2, color: AppColor.grey),
              tickCount: 4,
              gridBorderData: BorderSide(color: AppColor.grey, width: 2),
              borderData: FlBorderData(show: false),
              radarBorderData: BorderSide(color: AppColor.grey),
              titleTextStyle: TextStyle(color: AppColor.white, fontSize: 14),
              titlePositionPercentageOffset: 0.2,
              dataSets: list
                  .map((e) => RadarDataSet(
                        fillColor: e.color.withOpacity(0.2),
                        borderColor: e.color,
                        borderWidth: 2,
                        entryRadius: 0,
                        dataEntries:
                            e.values.map((e) => RadarEntry(value: e)).toList(),
                      ))
                  .toList()
              // read about it in the RadarChartData section
              ),
          swapAnimationDuration: Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear, // Optional
        ),
      ),
    );
  }

  Widget buildChartRadar(BiographyBloc _bloc) {
    return ExpandedSection(
      expand: isExpandedTactic,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: 1,
          child: RadarChartWidget(
            ticksTextStyle: TextStyle(
              fontSize: 12
            ),
            featuresTextStyle: TextStyle(
                fontSize: 10
            ),
            ticks: [50, 100, 150, 200,220],
            features: [
              "Attacking",
              "TURNOVERs",
              "ANALYTICS",
              "Defending",
              "Player DEv.",
              "SET PIECES"
            ],
            data: _bloc.listRaw
                .map((e) => e.values.map((e) => e.toInt()).toList())
                .toList(),
          ),
        ),
      ),
    );
  }
}
