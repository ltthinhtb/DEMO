import 'package:bloc_example/global/widget/appbar.dart';
import 'package:bloc_example/global/widget/drawer.dart';
import 'package:bloc_example/page/dashboard/dashboard_page.dart';
import 'package:bloc_example/page/feed/feed_page.dart';
import 'package:bloc_example/page/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screen = [
    FeedPage(),
    DashboardPage(),
    Scaffold(
      appBar: AppBar(
        title: Text("1"),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: Text("2"),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: Text("3"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeBloc();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          HomeBloc _bloc = context.read<HomeBloc>();
          return Scaffold(
            appBar: appBarCustom(context,title: _bloc.list[_bloc.indexScreen]),
            drawer: SideDrawer(),
            body: IndexedStack(
              children: screen,
              index: context.read<HomeBloc>().indexScreen,
            ),
          );
        },
      ),
    );
  }
}
