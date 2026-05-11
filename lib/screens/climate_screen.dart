import 'dart:math';
import '../widgets/power_row.dart';
import '../widgets/fan_speed.dart';
import 'package:flutter/material.dart';
import '../widgets/climate_header.dart';
import '../constants/app_colors.dart';
import '../painters/dial_painter.dart';
import '../widgets/adj_button.dart';
import '../widgets/stat_card.dart';
import '../widgets/climate_dial.dart';

class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  double targetTemp = 26.0;
  bool powerOn = true;
  int fanLevel = 1; // 0=Low, 1=Medium, 2=High

  static const double minTemp = 16.0;
  static const double maxTemp = 30.0;

  final List<String> fanLabels = ['Low', 'Medium', 'High'];
  final List<String> fanSubs = [
    'Quiet Mode',
    'Balanced Comfort',
    'Max Cooling'
  ];

  void adjustTemp(double delta) {
    if (!powerOn) return;
    setState(() {
      targetTemp = (targetTemp + delta).clamp(minTemp, maxTemp);
    });
  }

  void togglePower() {
    setState(() {
      powerOn = !powerOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D13),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              // **static state(need some adjustments)**
              // SingleChildScrollView(
              //   physics: const NeverScrollableScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClimateHeader(
                    powerOn: powerOn,
                    onPowerTap: togglePower,
                  ),

                  const SizedBox(height: 24),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: powerOn ? 1 : 0.35,
                    child: IgnorePointer(
                      ignoring: !powerOn,
                      child: _buildStatCards(),
                    ),
                  ),

                  const SizedBox(height: 14),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: powerOn ? 1 : 0.35,
                    child: IgnorePointer(
                      ignoring: !powerOn,
                      child: ClimateDial(
                        targetTemp: targetTemp,
                        minTemp: minTemp,
                        maxTemp: maxTemp,
                        onAdjust: adjustTemp,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // POWER BUTTON
                  PowerRow(
                    powerOn: powerOn,
                    onTap: togglePower,
                  ),

                  const SizedBox(height: 14),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: powerOn ? 1 : 0.35,
                    child: IgnorePointer(
                      ignoring: !powerOn,
                      child: FanSpeed(
                        fanLevel: fanLevel,
                        fanLabels: fanLabels,
                        fanSubs: fanSubs,
                        onChanged: (i) {
                          setState(() {
                            fanLevel = i;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // DARK OVERLAY
            if (!powerOn)
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCards() {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.thermostat_outlined,
            iconColor: const Color(0xFFE05555),
            iconBg: const Color(0xFFE05555).withOpacity(0.15),
            label: 'Temperature',
            value: '24.05',
            unit: '°C',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.water_drop_outlined,
            iconColor: const Color(0xFF4A9FD4),
            iconBg: const Color(0xFF4A9FD4).withOpacity(0.15),
            label: 'Humidity',
            value: '60',
            unit: '%',
          ),
        ),
      ],
    );
  }
}
