import 'package:bloc_example/service/model/app_config_model.dart';
import 'package:equatable/equatable.dart';

abstract class ConfigState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class AppStart extends ConfigState {
  @override
  String toString() {
    return 'AppStart{}';
  }
}

class ConfigLoaded extends ConfigState {
  final ConfigModel configModel;

  ConfigLoaded(this.configModel);

  @override
  String toString() {
    return 'ConfigLoaded{configModel: $configModel}';
  }
}

class ConfigLoading extends ConfigState {
  @override
  String toString() {
    return 'ConfigLoading{}';
  }
}

class ConfigLoadingError extends ConfigState {
  @override
  String toString() {
    return 'ConfigLoadingError{}';
  }
}
