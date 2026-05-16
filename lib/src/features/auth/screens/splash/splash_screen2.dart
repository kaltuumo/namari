import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/splash/splash_screen3.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: Stack(
        children: [
          // TOP BACKGROUND IMAGE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.4,
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned(
            top: 100, // kor ayuu uga soo sikayaa
            left: 50,
            right: 0,
            child: Image.asset(AppImages.splash2),
          ), // CENTER IMAGE (SALKA HOOSE LOO GEYEY)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.background3,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),

          // CONTENT
          // CONTENT
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TEXTS IN ONE PADDING
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      // TITLE
                      Text(
                        "Find your next\nflight effortlessly",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                          height: 1.2,
                        ),
                      ),

                      SizedBox(height: 16),

                      // SUBTITLE
                      Text(
                        "Create your account and enjoy big discounts for early adopters.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // DOTS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(isActive: true),
                    const SizedBox(width: 6),
                    _buildDot(isActive: false),
                    const SizedBox(width: 6),
                    _buildDot(isActive: false),
                  ],
                ),

                const SizedBox(height: 30),

                // BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.055,
                    child: AppButton(
                      text: "Get Started",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen3(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // DOT WIDGET
  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 12 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E293B) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
