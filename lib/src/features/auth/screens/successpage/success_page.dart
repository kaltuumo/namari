import 'package:flutter/material.dart';
import 'package:namari/src/app_navigator.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.08),

          child: Column(
            children: [
              /// 🔹 CENTER CONTENT
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.3),
                  Image.asset(AppImages.success),
                ],
              ),

              /// 🔥 PUSH BUTTON DOWN
              const Spacer(),
              Text(
                "Auto direct in 00:44",

                style: TextStyle(color: AppColors.grey),
              ),
              SizedBox(height: height * 0.01),

              SizedBox(
                width: double.infinity,
                height: height * 0.055,
                child: AppButton(
                  text: "Let's Explore",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppNavigator(),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
