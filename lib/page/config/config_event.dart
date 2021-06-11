import 'package:equatable/equatable.dart';

abstract class ConfigEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class InitConfig extends ConfigEvent {
  @override
  String toString() {
    return 'InitConfig{}';
  }
}

class ChangeTheme extends ConfigEvent {
  final String theme;

  ChangeTheme(this.theme);

  @override
  String toString() {
    return 'ChangeTheme{theme: $theme}';
  }
}
