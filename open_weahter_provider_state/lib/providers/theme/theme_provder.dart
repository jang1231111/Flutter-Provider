import 'package:flutter/material.dart';
import 'package:open_weahter_provider_state/constants/constants.dart';
import 'package:open_weahter_provider_state/providers/providers.dart';

part 'theme_state.dart';

class ThemeProvider with ChangeNotifier {
  ThemeState _state = ThemeState.initial();
  ThemeState get state => _state;

  void update(WeatherProvider wp) {
    if (wp.state.weather.temp > kWarmOrNot) {
      _state = _state.copyWith(appTheme: AppTheme.light);
    } else {
      _state = _state.copyWith(appTheme: AppTheme.dark);
    }

    print('Theme state : ${_state}');

    notifyListeners();
  }
}
