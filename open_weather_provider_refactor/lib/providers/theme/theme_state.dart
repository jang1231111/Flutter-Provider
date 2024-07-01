part of 'theme_provder.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState {
  final AppTheme appTheme;

  ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return ThemeState();
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeState && other.appTheme == appTheme;
  }

  @override
  int get hashCode => appTheme.hashCode;
}
