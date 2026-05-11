import 'package:flutter/material.dart';

class PowerRow extends StatelessWidget {
  final bool powerOn;
  final VoidCallback onTap;

  const PowerRow({
    super.key,
    required this.powerOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: powerOn
              ? const Color(0xFF4ECDC4).withOpacity(0.10)
              : const Color(0xFF1E2330).withOpacity(0.5),
          border: Border.all(
            color: powerOn
                ? const Color(0xFF4ECDC4).withOpacity(0.35)
                : const Color(0xFF1E2330),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4ECDC4).withOpacity(0.18),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.power_settings_new,
                    color: Color(0xFF4ECDC4),
                    size: 18,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Power',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFF0F2F5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        fontSize: 11,
                        color: powerOn
                            ? const Color(0xFF4ECDC4)
                            : const Color(0xFF6B7588),
                        fontWeight: FontWeight.w500,
                      ),
                      child: Text(
                        powerOn ? 'System Active' : 'System Off',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              height: 30,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color:
                    powerOn ? const Color(0xFF4ECDC4) : const Color(0xFF1E2330),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment:
                    powerOn ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
