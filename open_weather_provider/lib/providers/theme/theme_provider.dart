import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:open_weather_provider/constants/constants.dart';
import 'package:open_weather_provider/providers/theme/theme_state.dart';
import 'package:open_weather_provider/providers/weather/weather_provider.dart';
import 'package:state_notifier/state_notifier.dart';

class ThemeProvider extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProvider() : super(ThemeState.initial());

  @override
  void update(Locator watch) {
    final ws = watch<WeatherState>();

    if (ws.weather.temp > kWarmOrNot) {
      state = state.copyWith(appTheme: AppTheme.light);
    } else {
      state = state.copyWith(appTheme: AppTheme.dark);
    }

    super.update(watch);
  }
}
