import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/climate_screen.dart';

void main() {
  runApp(const VoraApp());
}

class VoraApp extends StatelessWidget {
  const VoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const ClimateScreen(),
    );
  }
}
