import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/service/model/news_feed.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
        height: 220+40,
        autoPlay: false,
        viewportFraction: 1,
      ),
      items: List<Widget>.generate(widget.newsFeed!.data!.length, (index) {
        if (widget.newsFeed!.data![index].type == "training")
          return buildTraining(widget.newsFeed!.data![index].training, index);
        else
          return buildMatch(widget.newsFeed!.data![index].match, index);
      }),
    );
  }

  Widget buildTraining(Training? training, int indexNews) {
    Map<String, double> result =
        Map.fromIterable(training!.chart as List<Chart>, key: (element) {
      if (element is Chart) {
        return element.chartItem ?? "";
      } else
        return "";
    }, value: (element) {
      if (element is Chart)
        return element.percent ?? 0.0;
      else
        return 0;
    });
    List<Color> listColor = [
      AppColor.green,
      AppColor.accentBlue,
      AppColor.purple,
      AppColor.blue
    ];
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PieChart(
              dataMap: result,
              chartType: ChartType.ring,
              animationDuration: Duration(milliseconds: 800),
              chartRadius: 50,
              colorList: listColor,
              initialAngleInDegree: 150,
              ringStrokeWidth: 15,
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: false,
                //legendShape: _BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: true,
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
                    "${training.timeTraning}",
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
                training.totalTime ?? "",
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
                        training.chart![index].chartItem ?? "",
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
              itemCount: training.chart!.length),
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
}
