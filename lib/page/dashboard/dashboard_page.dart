import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/page/dashboard/widget/total_component.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    List<Widget> listTabView = [
      TotalComponent(),
      Icon(Icons.directions_transit),
      Icon(Icons.directions_bike)
    ];
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc,DashboardState>(builder: (context, state) {
        DashboardBloc _bloc = context.read<DashboardBloc>();
        return DefaultTabController(
          length: 3,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTab(_bloc),
                IndexedStack(
                  children: listTabView,
                  index: _bloc.position
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildTab(DashboardBloc _bloc) {
    List<String> tabs = [
      S.current.total,
      S.current.training,
      S.current.matches
    ];
    return TabBar(
        onTap: (int _index) {
          _bloc.add(ChangeTabBar(_index));
        },
        isScrollable: true,
        indicatorColor: AppColor.yellow,
        tabs: tabs
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ))
            .toList());
  }
}
