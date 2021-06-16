import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/page/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_example/page/dashboard/widget/match_component.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/total_component.dart';
import 'widget/training_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child:
          BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        DashboardBloc _bloc = context.read<DashboardBloc>();
        List<Widget> listTabView = [
          TotalComponent(),
          TrainingComponent(),
          MatchComponent()
        ];
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: buildTab(_bloc),
            body: TabBarView(
              children: listTabView,
            ),
          ),
        );
      }),
    );
  }

  PreferredSizeWidget buildTab(DashboardBloc _bloc) {
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
