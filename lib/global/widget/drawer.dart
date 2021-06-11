import 'package:bloc_example/page/home/bloc/home_bloc.dart';
import 'package:bloc_example/service/model/player.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  @override
  Widget build(BuildContext context) {
    List<String> list = BlocProvider.of<HomeBloc>(context).list;

    return Container(
      color: AppColor.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 39),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
            SizedBox(height: 35),
            buildPlayerProfile(PlayerProfile(
                playerAvatar:
                    "https://cdn-img.thethao247.vn/storage/files/cuongnm/2021/06/03/messi-2-1622683347.jpeg",
                playerClub: "#RahSte070119",
                playerName: "Raheem Sterling",
                playerRole: "CAM")),
            SizedBox(height: 32),
            ...list
                .map((e) => GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeChangeScreen(list.indexOf(e)));
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: list.indexOf(e) ==
                                      BlocProvider.of<HomeBloc>(context)
                                          .indexScreen
                                  ? Color(0xFF13161A)
                                  : AppColor.black),
                          width: MediaQuery.of(context).size.width,
                          padding:
                              EdgeInsets.only(left: 105, top: 15, bottom: 15),
                          child: Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.copyWith(
                                    color: list.indexOf(e) ==
                                            BlocProvider.of<HomeBloc>(context)
                                                .indexScreen
                                        ? AppColor.yellow
                                        : AppColor.white),
                          )),
                    ))
                .toList()
          ],
        ),
      )),
    );
  }

  Widget buildPlayerProfile(PlayerProfile playerProfile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                playerProfile.playerAvatar ?? "",
                height: 75,
                width: 75,
                fit: BoxFit.cover,
              )),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(playerProfile.playerName ?? ""),
              SizedBox(height: 10),
              Text("${playerProfile.playerClub}   ${playerProfile.playerRole}"),
            ],
          )
        ],
      ),
    );
  }
}
