import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/splash/splash_screen1.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen size
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen1()),
          );
        },
        child: Container(
          width: width,
          height: height,
          color: AppColors.primaryColor, // ✅ Use AppColors
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  AppImages.logo,
                  width: width * 0.7,
                  height: width * 0.4,
                  fit: BoxFit.contain,
                ),
              ),

              // Qoraalka hooska (responsive)
              Positioned(
                bottom: height * 0.04,
                left: 0,
                right: 0,
                child: Text(
                  "Loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white, // ✅ Use AppColors
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
