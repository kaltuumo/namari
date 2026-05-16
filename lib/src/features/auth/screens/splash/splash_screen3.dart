import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/getstart/get_start.dart';
import 'package:namari/src/features/auth/screens/otp/otp_page.dart';
import 'package:namari/src/features/auth/screens/signin/signin_page.dart';
import 'package:namari/src/features/auth/screens/splash/splash_screen2.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

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
            top: height * 0.15,
            left: 0,
            right: 0,
            height: height * 0.5,
            child: Image.asset(AppImages.girl, fit: BoxFit.contain),
          ),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
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
}
