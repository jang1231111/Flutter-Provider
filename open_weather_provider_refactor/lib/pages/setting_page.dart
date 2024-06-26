import 'package:flutter/material.dart';
import 'package:open_weather_provider_refactor/providers/providers.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(10.0),
        child: ListTile(
          title: Text('Temeprature Unit'),
          subtitle: Text('Celsius/Fahrenheit (Default: Celsius)'),
          trailing: Switch(
            value: context.watch<TempSettingsProvider>().state.tempUnit ==
                TempUnit.celsius,
            onChanged: (_) {
              context.read<TempSettingsProvider>().toggleTempUnit();
            },
          ),
        ),
      ),
    );
  }
}
