import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/successpage/success_page.dart';

class ContinueBottomSheet extends StatelessWidget {
  const ContinueBottomSheet({super.key});

  // Habka loo waco Bottom Sheet-kan meel kasta oo laga rabo
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Si uu geeska wareegsan u muuqdo
      builder: (context) => const ContinueBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SuccessPage()),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), // Geesaha wareegsan ee kore
            topRight: Radius.circular(32),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Wuxuu qaadanayaa cabbirka qoraalka oo kaliya
          children: [
            const SizedBox(height: 10),

            // 2. GOOBADA TIRIYEHA AH (PROGRESS CIRCLE 55%)
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: CircularProgressIndicator(
                    value: 0.55, // 55% ayuu ka buuxsamayaa
                    strokeWidth: 4,
                    backgroundColor: const Color(
                      0xFFF1F5F9,
                    ), // Midabka asalka goobada
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF00C569),
                    ), // Cagaarka dhalaalaya
                  ),
                ),
                const Text(
                  "55%",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00C569),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 3. TIYTALKA (TITLE)
            const Text(
              "Preparing your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),

            // 4. QORAALKA HOOSE (SUBTITLE)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Please do not close this page or exit the app, as your account is currently being created.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF64748B), // Cirro nadiif ah
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
