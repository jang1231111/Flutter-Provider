import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:open_weahter_provider_state/models/custom_error.dart';
import 'package:open_weahter_provider_state/models/weather.dart';
import 'package:open_weahter_provider_state/providers/temp_settings/temp_settings_provider.dart';
import 'package:open_weahter_provider_state/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherProvider extends StateNotifier<WeatherState> with LocatorMixin {
  WeatherProvider() : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    state = state.copyWith(status: WeatherStatus.loading);
    try {
      read<WeatherRepository>();

      final Weather weather =
          await read<WeatherRepository>().fetchWeather(city);

      state = state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      );
      print('state : $state');
    } on CustomError catch (e) {
      state = state.copyWith(status: WeatherStatus.error, customError: e);
      print('state : $state');
    }
  }
}
