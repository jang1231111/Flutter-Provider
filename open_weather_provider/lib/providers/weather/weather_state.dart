part of 'weather_provider.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState {
  Weather weather;
  WeatherStatus status;
  CustomError error;

  WeatherState({
    required this.weather,
    required this.status,
    required this.error,
  });

  factory WeatherState.initial() {
    return WeatherState(
        weather: Weather.initial(),
        status: WeatherStatus.initial,
        error: CustomError(errMsg: ''));
  }

  @override
  String toString() =>
      'WeatherState(weather: $weather, status: $status, error: $error)';

  WeatherState copyWith({
    Weather? weather,
    WeatherStatus? status,
    CustomError? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
