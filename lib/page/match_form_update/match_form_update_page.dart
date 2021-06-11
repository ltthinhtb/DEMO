import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/drop_down.dart';
import 'package:bloc_example/global/widget/expanded_section.dart';
import 'package:bloc_example/global/widget/slider.dart';
import 'package:bloc_example/global/widget/text_field.dart';
import 'package:bloc_example/global/widget/video_component.dart';
import 'package:bloc_example/service/model/match_update_form_model.dart';
import 'package:bloc_example/service/model/media_file.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/util/const.dart';
import 'package:bloc_example/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'bloc/match_form_update.dart';

class MatchFormUpdatePage extends StatefulWidget {
  const MatchFormUpdatePage({Key? key}) : super(key: key);

  @override
  _MatchFormUpdatePageState createState() => _MatchFormUpdatePageState();
}

class _MatchFormUpdatePageState extends State<MatchFormUpdatePage> {
  late MatchFormUpdateBloc _bloc;
  bool isExpanded = true;


  @override
  void initState() {
    _bloc = MatchFormUpdateBloc();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _bloc,
      child: BlocBuilder<MatchFormUpdateBloc, MatchFormUpdateState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).diary_update,
              ),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      buildRowTime(Utils.convertDateFromString(
                          _bloc.matchUpdateFormModel.dateTime ??
                              DateTime.now().toString())),
                      SizedBox(height: 15),
                      buildDropDownSelectItem(
                          _bloc.matchUpdateFormModel.yourTeam ?? "",
                          _bloc.listTeam,
                          S.of(context).your_team, (String? team) {
                        _bloc.add(UpdateYourTeam(team ?? ""));
                      }),
                      SizedBox(height: 20),
                      buildSliderWidget(
                          _bloc.matchUpdateFormModel.energyLevel ?? 0,
                          S.of(context).how_is_your_energy, (double _value) {
                        _bloc.add(UpdateEnergyLevel(_value));
                      }, _bloc.listEnergyLevel),
                      SizedBox(height: 20),
                      buildSliderWidget(
                          _bloc.matchUpdateFormModel.sleepLevel ?? 0,
                          S.of(context).how_did_you_sleep, (double _value) {
                        _bloc.add(UpdateSleep(_value));
                      }, _bloc.listSleepLevel),
                      SizedBox(height: 20),
                      buildSliderWidget(
                          _bloc.matchUpdateFormModel.typeOfActivity ?? 0,
                          S.of(context).type_of_activity, (double _value) {
                        _bloc.add(UpdateTypeOfActivity(_value));
                      }, _bloc.listTypeOfActivityLevel),
                      SizedBox(height: 20),
                      buildSliderWidget(
                          _bloc.matchUpdateFormModel.eatingLevel ?? 0,
                          S.of(context).how_did_you_eat_and_drink,
                          (double _value) {
                        _bloc.add(UpdateEating(_value));
                      }, _bloc.listEatingLevel),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(child: buildDateTime()),
                          SizedBox(width: 10),
                          Flexible(
                              child: buildDropDownSelectItem(
                                  _bloc.matchUpdateFormModel.country ?? "",
                                  _bloc.listCountry,
                                  S.of(context).country, (String? country) {
                            _bloc.add(UpdateCountry(country ?? ""));
                          }))
                        ],
                      ),
                      SizedBox(height: 20),
                      buildDropDownSelectItem(
                          _bloc.matchUpdateFormModel.typeOfGame ?? "",
                          _bloc.listTypeOfGame,
                          S.of(context).type_of_game, (String? typeOfGame) {
                        _bloc.add(UpdateTypeOfGame(typeOfGame ?? ""));
                      }),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(
                              child: buildDropDownSelectItem(
                                  _bloc.matchUpdateFormModel.lengthTime ?? "",
                                  _bloc.listLengthTime,
                                  S.of(context).length, (String? lengthTime) {
                            _bloc.add(UpdateLengthTime(lengthTime ?? ""));
                          })),
                          SizedBox(width: 10),
                          Flexible(
                              child: buildDropDownSelectItem(
                                  _bloc.matchUpdateFormModel.place ?? "",
                                  _bloc.listPlace,
                                  S.of(context).place, (String? place) {
                            _bloc.add(UpdatePlace(place ?? ""));
                          }))
                        ],
                      ),
                      SizedBox(height: 20),
                      buildDropDownSelectItem(
                          _bloc.matchUpdateFormModel.club ?? "",
                          _bloc.listClub,
                          S.of(context).club, (String? club) {
                        _bloc.add(UpdateClub(club ?? ""));
                      }),
                      SizedBox(height: 20),
                      buildTextField(_bloc.teamController,
                          label: S.of(context).your_team,
                          onchange: (String? team) {
                        _bloc.add(
                          UpdateTextYourTeam(team ?? ""),
                        );
                      }, error: _bloc.errorYourTeam),
                      SizedBox(height: 20),
                      buildTextField(_bloc.opponentClubController,
                          label: S.of(context).opponent_club,
                          onchange: (String? opponent) {
                        _bloc.add(UpdateTextOpponentClub(opponent ?? ""));
                      }, error: _bloc.errorOpponentClub),
                      SizedBox(height: 20),
                      buildTextField(_bloc.arenaController,
                          label: S.of(context).arena,
                          onchange: (String? arena) {
                        _bloc.add(UpdateTextArena(arena ?? ""));
                      }, error: _bloc.errorArena),
                      buildResult(),
                      SizedBox(height: 10),
                      buildGoals(),
                      SizedBox(height: 25),
                      buildAction(),
                      SizedBox(height: 20),
                      buildSliderWidget(
                          _bloc.matchUpdateFormModel.physically ?? 0,
                          S.of(context).how_physically_strain,
                          (double physically) {
                        _bloc.add(UpdatePhysically(physically));
                      }, _bloc.listPhysicallyLevel),
                      SizedBox(height: 20),
                      buildRatingBar(),
                      SizedBox(height: 20),
                      buildListPlayer(),
                      SizedBox(height: 20),
                      buildTextField(_bloc.matchReviewController,
                          label: S.of(context).match_review,
                          maxLine: 3,
                          hintText: S.of(context).match_review_label),
                      SizedBox(height: 20),
                      buildMedia(),
                      SizedBox(height: 20),
                      buildSaveButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRowTime(DateTime dataTime) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.darkPrimary),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Text(Utils.parseDateToString(dataTime, Const.TIME_HOUR)),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_left),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.darkPrimary),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Text(Utils.parseDateToString(dataTime, Const.TIME_DAY)),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_right),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight)
      ],
    );
  }

  Widget buildDateTime() {
    return GestureDetector(
      onTap: () {
        DatePicker.showDateTimePicker(context,
            theme: DatePickerTheme(backgroundColor: AppColor.white),
            showTitleActions: true,
            minTime: DateTime(2018, 3, 5),
            maxTime: DateTime.now(), onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          _bloc.add(UpdateDateTime(date));
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: buildTextField(_bloc.timeController,
          label: S.of(context).date_time,
          onchange: (String? time) {},
          error: _bloc.errorTime,
          enable: false,
          suffixIcon: Icon(Icons.calendar_today)),
    );
  }

  Widget buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          S.of(context).result,
          style: TextStyle(
            color: AppColor.grey_50,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Flexible(
                child: buildTextField(_bloc.yourTeamScoreController,
                    label: S.of(context).your_team,
                    onchange: (value) {},
                    error: _bloc.errorArena,
                    suffixIcon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {}, child: Icon(Icons.arrow_drop_up)),
                        GestureDetector(
                            onTap: () {}, child: Icon(Icons.arrow_drop_down))
                      ],
                    ))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(":"),
            ),
            Flexible(
                child: buildTextField(_bloc.opponentScoreController,
                    label: S.of(context).opponents,
                    onchange: (value) {},
                    error: _bloc.errorArena,
                    suffixIcon: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {}, child: Icon(Icons.arrow_drop_up)),
                        GestureDetector(
                            onTap: () {}, child: Icon(Icons.arrow_drop_down))
                      ],
                    ))),
            SizedBox(height: 10),
            // buildTextField(_bloc.matchReviewController,
            //     S.of(context).match_review, (String? value) {}, "")
          ],
        )
      ],
    );
  }

  Widget buildGoals() {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (2 / 10)),
        1: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (4.5 / 10)),
        2: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (3.5 / 10)),
      },
      children: [
        TableRow(children: [
          Text(S.of(context).minute,
              style: TextStyle(color: AppColor.grey_500)),
          Text(S.of(context).goalscorer,
              style: TextStyle(color: AppColor.grey_500)),
          Text(S.of(context).assist, style: TextStyle(color: AppColor.grey_500))
        ]),
        ..._bloc.listGoal.map((e) => TableRow(children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: dropDown(e.minute.toString(), ["21", "18", "22"]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: dropDown(
                    e.goalsocrer.toString(), ["Leo Messi", "Neo Jonhson"]),
              ),
              dropDown(e.assist.toString(), ["Leo Messi", "Neo Jonhson"])
            ]))
      ],
    );
  }

  Widget buildAction() {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (2 / 10)),
        1: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (4.5 / 10)),
        2: FixedColumnWidth(
            (MediaQuery.of(context).size.width - 40) * (3.5 / 10)),
      },
      children: [
        TableRow(children: [
          Text(S.of(context).minute,
              style: TextStyle(color: AppColor.grey_500)),
          Text(S.of(context).action,
              style: TextStyle(color: AppColor.grey_500)),
          Text(S.of(context).player, style: TextStyle(color: AppColor.grey_500))
        ]),
        ..._bloc.listAction.map((e) => TableRow(children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: dropDown(e.minute.toString(), ["21", "18", "22"]),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child:
                    dropDown(e.action.toString(), ["Yellow Card", "Red Card"]),
              ),
              dropDown(e.player.toString(), ["Leo Messi", "Neo Jonhson"])
            ]))
      ],
    );
  }

  Widget dropDown(String value, List<String> items) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            ),
            value: items.contains(value) ? value : null,
            onChanged: (_) {},
            isExpanded: true,
            items: items
                .map((element) => DropdownMenuItem(
                      child: Text(element),
                      value: element,
                      onTap: () {},
                    ))
                .toList()),
      ),
    );
  }

  Widget buildRatingBar() {
    return Row(
      children: [
        Expanded(child: Text(S.of(context).team_performance)),
        RatingBar(
          initialRating: _bloc.matchUpdateFormModel.teamPerformance ?? 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 28,
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
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
  }

  Widget buildListPlayer() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "${S.of(context).total_player(_bloc.listPlayer.length)}",
                style: TextStyle(color: AppColor.grey_500),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: Icon(Icons.view_list_sharp)),
          ],
        ),
        SizedBox(height: 5),
        ExpandedSection(
          expand: isExpanded,
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _bloc.listPlayer.length,
            itemBuilder: (context, int index) {
              return buildPlayerComponent(_bloc.listPlayer[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 20);
            },
          ),
        )
      ],
    );
  }

  Widget buildPlayerComponent(Player player) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              player.avatar ?? "",
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            )),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(player.name ?? "",
                style: TextStyle(color: AppColor.grey_500, fontSize: 12)),
            SizedBox(height: 20),
            Text(player.role ?? "",
                style: TextStyle(color: AppColor.grey_500, fontSize: 12)),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: RatingBar(
            initialRating: player.rating ?? 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 28,
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
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: AppColor.grey_500,
        )
      ],
    );
  }

  Widget buildMedia() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: _bloc.listMedia.length > 0,
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: _bloc.listMedia
                .map((e) => Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                          width: (MediaQuery.of(context).size.width - 56) / 3,
                          child: e.type == MediaFile.image
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  _showDialog(context, isPhoto: true);
                },
                icon: Icon(
                  Icons.add_a_photo_outlined,
                  size: 32,
                ),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft),
            IconButton(
                onPressed: () {
                  _showDialog(context, isPhoto: false);
                },
                icon: Icon(
                  Icons.video_call_outlined,
                  size: 32,
                ),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft)
          ],
        ),
      ],
    );
  }

  Future<void> _showDialog(BuildContext context, {bool? isPhoto}) {
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
                      _bloc.add(PickMedia(isPhoto!, true));
                      Navigator.pop(context);
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(S.of(context).camera),
                    onPressed: () {
                      _bloc.add(PickMedia(isPhoto!, false));
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  Widget buildSaveButton() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        S.of(context).save,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
