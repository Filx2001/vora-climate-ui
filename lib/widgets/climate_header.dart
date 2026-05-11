import 'package:flutter/material.dart';

class ClimateHeader extends StatelessWidget {
  final bool powerOn;
  final VoidCallback onPowerTap;

  const ClimateHeader({
    super.key,
    required this.powerOn,
    required this.onPowerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Climate',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF6B7588),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Living Room',
              style: TextStyle(
                fontSize: 45,
                color: Color(0xFFF0F2F5),
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onPowerTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: powerOn
                  ? const Color(0xFF4ECDC4).withOpacity(0.12)
                  : const Color(0xFF6B7588).withOpacity(0.12),
              border: Border.all(
                color: powerOn
                    ? const Color(0xFF4ECDC4).withOpacity(0.35)
                    : const Color(0xFF6B7588).withOpacity(0.35),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: powerOn
                        ? const Color(0xFF4ECDC4)
                        : const Color(0xFF6B7588),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 11,
                    color: powerOn
                        ? const Color(0xFF4ECDC4)
                        : const Color(0xFF6B7588),
                    fontWeight: FontWeight.w600,
                  ),
                  child: Text(
                    powerOn ? 'Active' : 'Inactive',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
