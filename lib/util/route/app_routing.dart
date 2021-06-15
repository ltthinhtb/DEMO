import 'package:bloc_example/page/home/home_page.dart';
import 'package:bloc_example/page/match_form_update/match_form_update_page.dart';
import 'package:bloc_example/page/sign_up_form/sign_up_form_page.dart';
import 'package:flutter/material.dart';

enum RouteDefine {
  MathUpdateForm,
  SignUp,
  Home,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.MathUpdateForm.name: (_) => MatchFormUpdatePage(),
      RouteDefine.SignUp.name: (_) => SignUpFormPage(),
      RouteDefine.Home.name: (_) => HomePage(),
      // RouteDefine.ListUserScreen.name: (_) => ListUserRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return _NoAnimationMaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(_, __, ___, Widget child) => child;
}

extension RouteExt on Object {
  /// Use this to get the enum value converted to string.
  ///
  /// Eg.
  /// ```dart
  /// print(SomeEnum.someValue.name) // someValue
  /// ```
  ///
  String get name => toString().substring(toString().indexOf('.') + 1);
}
