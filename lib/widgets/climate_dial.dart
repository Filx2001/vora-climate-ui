import 'package:flutter/material.dart';

import '../painters/dial_painter.dart';
import 'adj_button.dart';

class ClimateDial extends StatelessWidget {
  final double targetTemp;
  final double minTemp;
  final double maxTemp;

  final Function(double) onAdjust;

  const ClimateDial({
    super.key,
    required this.targetTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.onAdjust,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        16,
        20,
        16,
        20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF131720),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF1E2330),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'TARGET TEMPERATURE',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF6B7588),
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 350,
            height: 350,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 25,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    width: 260,
                    height: 260,
                    child: CustomPaint(
                      painter: DialPainter(
                        targetTemp: targetTemp,
                        minTemp: minTemp,
                        maxTemp: maxTemp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  right: 20,
                  child: SizedBox(
                    height: 310,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          targetTemp.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 46,
                            color: Color(0xFFF0F2F5),
                            fontWeight: FontWeight.w200,
                            height: 1,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'TARGET TEMP',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF6B7588),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 25,
                  child: AdjButton(
                    icon: Icons.remove,
                    color: const Color(0xFF5080DD),
                    bg: const Color(0xFF5080DD).withOpacity(0.15),
                    border: const Color(0xFF5080DD).withOpacity(0.3),
                    onTap: () => onAdjust(-0.5),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 25,
                  child: AdjButton(
                    icon: Icons.add,
                    color: const Color(0xFFE05555),
                    bg: const Color(0xFFE05555).withOpacity(0.15),
                    border: const Color(0xFFE05555).withOpacity(0.3),
                    onTap: () => onAdjust(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
