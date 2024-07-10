part of 'temp_settings_provider.dart';

enum TempUnit {
  celsius,
  fahrenheit,
}

class TempSettingsState {
  TempUnit tempUnit;

  TempSettingsState({
    this.tempUnit = TempUnit.celsius,
  });

  factory TempSettingsState.initial() {
    return TempSettingsState();
  }

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TempSettingsState && other.tempUnit == tempUnit;
  }

  @override
  int get hashCode => tempUnit.hashCode;
}
