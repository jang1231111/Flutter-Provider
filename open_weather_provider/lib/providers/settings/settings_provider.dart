import 'package:flutter_state_notifier/flutter_state_notifier.dart';

part 'settings_state.dart';

class SettingsProvider extends StateNotifier<SettingsState> {
  SettingsProvider() : super(SettingsState.initial());

  void toggleTemepratureType() {
    state = state.copyWith(
        temperatureType: state.temperatureType == TemperatureType.Celsius
            ? TemperatureType.Fahrenheit
            : TemperatureType.Celsius);

    print('Setting Provider State : $state');
  }
}
