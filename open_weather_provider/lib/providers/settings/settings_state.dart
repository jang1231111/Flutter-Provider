part of 'settings_provider.dart';

enum TemperatureType {
  Celsius,
  Fahrenheit,
}

class SettingsState {
  TemperatureType temperatureType;

  SettingsState({
    required this.temperatureType,
  });

  factory SettingsState.initial() {
    return SettingsState(temperatureType: TemperatureType.Celsius);
  }

  @override
  String toString() => 'SettingsState(temperatureType: $temperatureType)';

  SettingsState copyWith({
    TemperatureType? temperatureType,
  }) {
    return SettingsState(
      temperatureType: temperatureType ?? this.temperatureType,
    );
  }
}
