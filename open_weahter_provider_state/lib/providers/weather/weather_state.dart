part of 'weather_provider.dart';

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}

class WeatherState {
  final WeatherStatus status;
  final Weather weather;
  final CustomError error;

  WeatherState(
      {required this.status, required this.weather, required this.error});

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? customError,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: customError ?? this.error,
    );
  }

  factory WeatherState.initial() {
    return WeatherState(
        status: WeatherStatus.initial,
        weather: Weather.initial(),
        error: CustomError());
  }

  @override
  String toString() =>
      'WeatherState(status: $status, weather: $weather, customError: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherState &&
        other.status == status &&
        other.weather == weather &&
        other.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ weather.hashCode ^ error.hashCode;
}
