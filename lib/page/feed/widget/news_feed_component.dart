import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/service/model/news_feed.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/theme/image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedComponent extends StatefulWidget {
  final NewsFeed? newsFeed;

  const NewsFeedComponent({Key? key, this.newsFeed}) : super(key: key);

  @override
  _NewsFeedComponentState createState() => _NewsFeedComponentState();
}

class _NewsFeedComponentState extends State<NewsFeedComponent> {
  int indexNews = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Theme.of(context).canvasColor),
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUserInfo(),
          Divider(
            thickness: 1,
            height: 40,
          ),
          buildCarouselSlider(),
          SizedBox(height: 20),
          buildBottomNews(),
        ],
      ),
    );
  }

  Widget buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (int index, reason) {
          setState(() {
            indexNews = index;
          });
        },
        height: 220 + 40,
        autoPlay: false,
        viewportFraction: 1,
      ),
      items: List<Widget>.generate(widget.newsFeed!.data!.length, (index) {
        if (widget.newsFeed!.data![index].type == "training")
          return buildTraining(widget.newsFeed!.data![index].training, index);
        if (widget.newsFeed!.data![index].type == "graph")
          return buildGraph(widget.newsFeed!.data![index].graphMatch, index);
        if (widget.newsFeed!.data![index].type == "injury")
          return buildInjury(widget.newsFeed!.data![index].injury);
        else
          return buildMatch(widget.newsFeed!.data![index].match, index);
      }),
    );
  }

  Widget buildTraining(Training? training, int indexNews) {
    List<Color> listColor = [
      AppColor.green,
      AppColor.accentBlue,
      AppColor.purple,
      AppColor.blue
    ];
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 75,
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(PieChartData(
                    startDegreeOffset: 150,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 4,
                    sections: training?.chart!
                        .map((element) => PieChartSectionData(
                        showTitle: false,
                        color: listColor[
                        training.chart!.indexOf(element)],
                        title: element.chartItem,
                        radius: 15,
                        value: element.percent))
                        .toList())),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.current.training,
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 5),
                  Text(
                    "${training?.timeTraning}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).buttonColor),
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: AppColor.red)),
              child: Text(
                training?.totalTime ?? "",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - 22 - 30 - 30) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        training!.chart![index].chartItem ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: listColor[index]),
                      ),
                      SizedBox(height: 5),
                      Text(
                        training.chart![index].time ?? "",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                  width: 10,
                  child: VerticalDivider(
                    color: AppColor.grey,
                  ),
                );
              },
              itemCount: training!.chart!.length),
        ),
        Divider(
          thickness: 1,
          height: 40,
        ),
        Flexible(
          child: Text(
            widget.newsFeed!.data![indexNews].describe ?? "",
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Widget buildMatch(Match? match, indexNews) {
    return Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                match!.team1!.teamClub ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.black),
              ),
              SizedBox(width: 10),
              Image.network(
                match.team1!.teamLogo ?? "",
                width: 25,
                height: 25,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: 10),
              Container(
                alignment: Alignment.center,
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                decoration: BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                    "${match.team1!.score!.toString()} : ${match.team2!.score!.toString()}"),
              ),
              SizedBox(width: 10),
              Text(
                match.team2!.teamClub ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.black),
              ),
              SizedBox(width: 10),
              Image.network(
                match.team2!.teamLogo ?? "",
                width: 25,
                height: 25,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              match.dateTime ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColor.grey),
            ),
            Spacer(),
            Text(
              match.season ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColor.grey),
            )
          ],
        ),
        Divider(
          thickness: 1,
          height: 40,
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - 22 - 30 - 30) / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        match.matchStats![index].stats ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColor.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        match.matchStats![index].value ?? "",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                  width: 10,
                  child: VerticalDivider(
                    color: AppColor.grey,
                  ),
                );
              },
              itemCount: match.matchStats!.length),
        ),
        Divider(
          thickness: 1,
          height: 40,
        ),
        Flexible(
          child: Text(
            widget.newsFeed!.data![indexNews].describe ?? "",
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 3,
          ),
        ),
      ],
    );
  }

  Widget buildGraph(GraphMatch? graphMatch, indexNews) {
    List<Color> listColor = [
      AppColor.green,
      AppColor.purple,
      AppColor.accentBlue
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 220,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: LineChart(LineChartData(
                titlesData: FlTitlesData(show: false),
                lineTouchData: LineTouchData(enabled: false),
                minY: -6,
                maxY: 6,
                gridData: FlGridData(checkToShowHorizontalLine: (double value) {
                  if (value == 0)
                    return true;
                  else
                    return false;
                }),
                lineBarsData: List<LineChartBarData>.generate(
                    graphMatch!.graphData!.length, (int index) {
                  return LineChartBarData(
                      barWidth: 4,
                      colors: [listColor[index]],
                      spots: List<FlSpot>.generate(
                          graphMatch.graphData![index].value!.length, (int i) {
                        return FlSpot(
                            graphMatch.graphData![index].value![i].time ?? 0,
                            graphMatch.graphData![index].value![i].value ?? 0);
                      }));
                }))),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Spacer(),
            ...graphMatch.graphData!
                .map((e) => Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: listColor[graphMatch.graphData!.indexOf(e)],
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          e.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: listColor[
                                      graphMatch.graphData!.indexOf(e)]),
                        ),
                      ],
                    )))
                .toList()
          ],
        )
      ],
    );
  }

  Widget buildUserInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.newsFeed!.userAvatar ?? "",
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.newsFeed!.userName ?? "",
                  style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: Theme.of(context).buttonColor,
                  ),
                  SizedBox(
                    width: 5.6,
                  ),
                  Text(
                    "${widget.newsFeed!.timeAgo} - ${widget.newsFeed!.address}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).buttonColor),
                  )
                ],
              )
            ],
          ),
        ),
        Icon(
          Icons.tag_faces_sharp,
          color: AppColor.green,
        )
      ],
    );
  }

  Widget buildBottomNews() {
    return Row(
      children: [
        Icon(Icons.favorite_border_outlined, color: AppColor.green),
        SizedBox(width: 9),
        Text(widget.newsFeed!.data!.first.feeling.toString()),
        Spacer(),
        SingleChildScrollView(
          child: Row(
            children: List<Widget>.generate(widget.newsFeed!.data!.length,
                (int index) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: indexNews == index ? AppColor.white : AppColor.grey),
              );
            }),
          ),
        ),
        Spacer(),
        Icon(Icons.comment_bank_outlined, color: AppColor.green),
        SizedBox(width: 9),
        Text(widget.newsFeed!.data!.first.comment.toString()),
      ],
    );
  }

  Widget buildInjury(Injury? injury) {
    return SizedBox(
      height: 220,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            body,
            height: 220,
            width: 150,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 170 - 20,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: LineChart(LineChartData(
                        titlesData: FlTitlesData(show: false),
                        lineTouchData: LineTouchData(enabled: false),
                        minY: 0,
                        minX: injury!.value!.first.time,
                        maxX: injury.value!.last.time,
                        maxY: 6,
                        gridData: FlGridData(
                            checkToShowHorizontalLine: (double value) {
                          if (value == 0)
                            return true;
                          else
                            return false;
                        }),
                        lineBarsData: [
                          LineChartBarData(
                              colors: [AppColor.accentBlue],
                              dotData: FlDotData(show: false),
                              spots: injury.value!
                                  .map((e) => FlSpot(e.time ?? 0, e.value ?? 0))
                                  .toList())
                        ])),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  injury.describe ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(64),
                          color: AppColor.accentBlue),
                      child: Text(injury.site ?? "",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
