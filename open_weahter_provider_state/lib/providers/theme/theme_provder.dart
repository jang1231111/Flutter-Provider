import 'package:open_weahter_provider_state/constants/constants.dart';
import 'package:open_weahter_provider_state/providers/providers.dart';
import 'package:state_notifier/state_notifier.dart';

part 'theme_state.dart';

class ThemeProvider extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProvider() : super(ThemeState.initial());

  @override
  void update(Locator watch) {
    final wp = watch<WeatherProvider>();

    if (wp.state.weather.temp > kWarmOrNot) {
      state = state.copyWith(appTheme: AppTheme.light);
    } else {
      state = state.copyWith(appTheme: AppTheme.dark);
    }

    super.update(watch);
  }
}
