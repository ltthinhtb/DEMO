import 'package:bloc_example/page/config/config.dart';
import 'package:bloc_example/page/home/home_page.dart';
import 'package:bloc_example/page/sign_up_form/sign_up_form_page.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:bloc_example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';
import 'page/match_form_update/match_form_update_page.dart';
import 'service/model/app_config_model.dart';
import 'util/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  ConfigModel configModel = await loadConfigApp();
  runApp(MyApp(configModel: configModel));
}

Future<ConfigModel> loadConfigApp() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  ConfigModel configModel = ConfigModel(
      language: prefs.getString(Const.BRIGHT_MODE),
      theme: prefs.getString(Const.BRIGHT_MODE));
  return configModel;
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class MyApp extends StatefulWidget {
  final ConfigModel configModel;

  const MyApp({Key? key, required this.configModel}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfigBloc _bloc;

  @override
  void initState() {
    _bloc = ConfigBloc(widget.configModel);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1242, 2688),
        builder: () {
          return BlocProvider(
              create: (_) => _bloc,
              lazy: true,
              child: BlocBuilder<ConfigBloc, ConfigState>(
                builder: (context, state) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: _bloc.configModel.locale ?? Locale(Const.LOCALE_EN),
                    title: 'Flutter Bloc',
                    theme: _bloc.configModel.themeData ?? AppTheme.lightTheme,
                    home: HomePage(),
                  );
                },
              ));
        });
  }
}

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpFormPage()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColor.blue),
                child: Text("Sign up Page"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MatchFormUpdatePage()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: AppColor.blue),
                child: Text("Update Page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
