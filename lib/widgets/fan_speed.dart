import 'package:flutter/material.dart';

class FanSpeed extends StatelessWidget {
  final int fanLevel;
  final List<String> fanLabels;
  final List<String> fanSubs;
  final Function(int) onChanged;

  const FanSpeed({
    super.key,
    required this.fanLevel,
    required this.fanLabels,
    required this.fanSubs,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131720),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF1E2330),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.air,
                size: 13,
                color: Color(0xFF6B7588),
              ),
              const SizedBox(width: 8),
              const Text(
                'FAN SPEED',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF6B7588),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: List.generate(3, (i) {
              final active = i == fanLevel;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: i < 2 ? 8 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => onChanged(i),
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 150,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: active
                            ? const Color(0xFF4ECDC4).withOpacity(0.15)
                            : Colors.transparent,
                        border: Border.all(
                          color: active
                              ? const Color(0xFF4ECDC4).withOpacity(0.5)
                              : const Color(0xFF1E2330),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        fanLabels[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: active
                              ? const Color(0xFF4ECDC4)
                              : const Color(0xFF6B7588),
                          fontWeight:
                              active ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              fanSubs[fanLevel],
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF4ECDC4),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
