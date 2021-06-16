// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Diary Update`
  String get diary_update {
    return Intl.message(
      'Diary Update',
      name: 'diary_update',
      desc: '',
      args: [],
    );
  }

  /// `Your Team`
  String get your_team {
    return Intl.message(
      'Your Team',
      name: 'your_team',
      desc: '',
      args: [],
    );
  }

  /// `How is your energy level?`
  String get how_is_your_energy {
    return Intl.message(
      'How is your energy level?',
      name: 'how_is_your_energy',
      desc: '',
      args: [],
    );
  }

  /// `How did you sleep?`
  String get how_did_you_sleep {
    return Intl.message(
      'How did you sleep?',
      name: 'how_did_you_sleep',
      desc: '',
      args: [],
    );
  }

  /// `Type of activity?`
  String get type_of_activity {
    return Intl.message(
      'Type of activity?',
      name: 'type_of_activity',
      desc: '',
      args: [],
    );
  }

  /// `How did you eat and drink?`
  String get how_did_you_eat_and_drink {
    return Intl.message(
      'How did you eat and drink?',
      name: 'how_did_you_eat_and_drink',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Date & time`
  String get date_time {
    return Intl.message(
      'Date & time',
      name: 'date_time',
      desc: '',
      args: [],
    );
  }

  /// `Type of game`
  String get type_of_game {
    return Intl.message(
      'Type of game',
      name: 'type_of_game',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get length {
    return Intl.message(
      'Length',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get place {
    return Intl.message(
      'Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Club`
  String get club {
    return Intl.message(
      'Club',
      name: 'club',
      desc: '',
      args: [],
    );
  }

  /// `Opponent Club`
  String get opponent_club {
    return Intl.message(
      'Opponent Club',
      name: 'opponent_club',
      desc: '',
      args: [],
    );
  }

  /// `Arena`
  String get arena {
    return Intl.message(
      'Arena',
      name: 'arena',
      desc: '',
      args: [],
    );
  }

  /// `Please input phone Number`
  String get please_input_phone_number {
    return Intl.message(
      'Please input phone Number',
      name: 'please_input_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone not valid`
  String get phone_not_valid {
    return Intl.message(
      'Phone not valid',
      name: 'phone_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Please input your team`
  String get please_input_your_team {
    return Intl.message(
      'Please input your team',
      name: 'please_input_your_team',
      desc: '',
      args: [],
    );
  }

  /// `Please input opponent club`
  String get please_input_opponent_club {
    return Intl.message(
      'Please input opponent club',
      name: 'please_input_opponent_club',
      desc: '',
      args: [],
    );
  }

  /// `Please input arena`
  String get please_input_arena {
    return Intl.message(
      'Please input arena',
      name: 'please_input_arena',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Opponents`
  String get opponents {
    return Intl.message(
      'Opponents',
      name: 'opponents',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get minute {
    return Intl.message(
      'Minute',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `Goalscorer`
  String get goalscorer {
    return Intl.message(
      'Goalscorer',
      name: 'goalscorer',
      desc: '',
      args: [],
    );
  }

  /// `Assist`
  String get assist {
    return Intl.message(
      'Assist',
      name: 'assist',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message(
      'Action',
      name: 'action',
      desc: '',
      args: [],
    );
  }

  /// `Player`
  String get player {
    return Intl.message(
      'Player',
      name: 'player',
      desc: '',
      args: [],
    );
  }

  /// `How physically strain, was it? `
  String get how_physically_strain {
    return Intl.message(
      'How physically strain, was it? ',
      name: 'how_physically_strain',
      desc: '',
      args: [],
    );
  }

  /// `Team performance`
  String get team_performance {
    return Intl.message(
      'Team performance',
      name: 'team_performance',
      desc: '',
      args: [],
    );
  }

  /// `{total} Players`
  String total_player(Object total) {
    return Intl.message(
      '$total Players',
      name: 'total_player',
      desc: '',
      args: [total],
    );
  }

  /// `Match Review`
  String get match_review {
    return Intl.message(
      'Match Review',
      name: 'match_review',
      desc: '',
      args: [],
    );
  }

  /// `Describe what he did well and what he could have done better`
  String get match_review_label {
    return Intl.message(
      'Describe what he did well and what he could have done better',
      name: 'match_review_label',
      desc: '',
      args: [],
    );
  }

  /// `Please choose media`
  String get upload_media {
    return Intl.message(
      'Please choose media',
      name: 'upload_media',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Sign up form`
  String get sign_up_form {
    return Intl.message(
      'Sign up form',
      name: 'sign_up_form',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `BirthDate`
  String get birthday {
    return Intl.message(
      'BirthDate',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Face image`
  String get face_image {
    return Intl.message(
      'Face image',
      name: 'face_image',
      desc: '',
      args: [],
    );
  }

  /// `Full Body image`
  String get body_image {
    return Intl.message(
      'Full Body image',
      name: 'body_image',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get add_photo {
    return Intl.message(
      'Add photo',
      name: 'add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feed {
    return Intl.message(
      'Feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Account & Setting`
  String get account_setting {
    return Intl.message(
      'Account & Setting',
      name: 'account_setting',
      desc: '',
      args: [],
    );
  }

  /// `Biography`
  String get biography {
    return Intl.message(
      'Biography',
      name: 'biography',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Diary`
  String get diary {
    return Intl.message(
      'Diary',
      name: 'diary',
      desc: '',
      args: [],
    );
  }

  /// `Team training`
  String get training_team {
    return Intl.message(
      'Team training',
      name: 'training_team',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Matches`
  String get matches {
    return Intl.message(
      'Matches',
      name: 'matches',
      desc: '',
      args: [],
    );
  }

  /// `YOU`
  String get you {
    return Intl.message(
      'YOU',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `AVG`
  String get avg {
    return Intl.message(
      'AVG',
      name: 'avg',
      desc: '',
      args: [],
    );
  }

  /// `Practice Tag Cloud`
  String get practice_tag {
    return Intl.message(
      'Practice Tag Cloud',
      name: 'practice_tag',
      desc: '',
      args: [],
    );
  }

  /// `Training updates`
  String get training_update {
    return Intl.message(
      'Training updates',
      name: 'training_update',
      desc: '',
      args: [],
    );
  }

  /// `POSITION`
  String get position {
    return Intl.message(
      'POSITION',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `EDUCATION`
  String get education {
    return Intl.message(
      'EDUCATION',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `EXP.LEVEL`
  String get level {
    return Intl.message(
      'EXP.LEVEL',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `AGE`
  String get age {
    return Intl.message(
      'AGE',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Fans`
  String get fans {
    return Intl.message(
      'Fans',
      name: 'fans',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
