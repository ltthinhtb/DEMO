import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/page/feed/bloc/feed_bloc.dart';
import 'package:bloc_example/page/feed/widget/news_feed_component.dart';
import 'package:bloc_example/service/model/match_update_form_model.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/util/route/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return FeedBloc();
      },
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          FeedBloc _bloc = context.read<FeedBloc>();
          return Scaffold(
            body: DefaultTabController(
              length: 1,
              child: SingleChildScrollView(
                child: Container(
                  color: AppColor.darkPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTab(),
                      SizedBox(height: 10),
                      buildListPlayerRow(context.read<FeedBloc>().listPlayer),
                      SizedBox(height: 16),
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return NewsFeedComponent(
                                newsFeed: _bloc.listNews[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 16);
                          },
                          itemCount: _bloc.listNews.length),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
              //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  Navigator.pushNamed(context, RouteDefine.MathUpdateForm.name);
                },
                tooltip: 'Increment',
                child: Icon(Icons.add,color: AppColor.white),
              )
          );
        },
      ),
    );
  }


  Widget buildTab() {
    return TabBar(isScrollable: true, indicatorColor: AppColor.yellow, tabs: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(S.current.diary,style: Theme.of(context).textTheme.bodyText2,),
      ),
    ]);
  }

  Widget buildListPlayerRow(List<Player> list) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
          height: 60 + 20,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      list[index].avatar ?? "",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    list[index].name ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 20);
            },
          )),
    );
  }
}
