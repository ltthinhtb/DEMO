import 'package:bloc_example/service/model/app_config_model.dart';
import 'package:bloc_example/util/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';
import 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc(this.configModel) : super(AppStart()) {
    add(InitConfig());
  }

  late SharedPreferences prefs;

  //default config model
   final ConfigModel configModel;

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    prefs = await SharedPreferences.getInstance();
    // TODO: implement mapEventToState
    if (event is InitConfig) {
      yield ConfigLoading();
      yield ConfigLoaded(configModel);
    }

    if (event is ChangeTheme) {
      yield ConfigLoading();
      changeTheme(event.theme);
      yield ConfigLoaded(configModel);
    }
  }

  void changeTheme(String theme) {
    prefs.setString(Const.BRIGHT_MODE, theme);
    configModel.getTheme(theme);
  }

}
