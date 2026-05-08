import 'package:flutter/material.dart';
import 'package:namari/src/app_navigator.dart';
import 'package:namari/src/features/pages/screen/home/widget/departure_bottomsheet.dart';
import 'package:namari/src/features/pages/screen/home/widget/flight_page.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({super.key});

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
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
                  Image.asset(AppImages.currentimage),
                ],
              ),

              /// 🔥 PUSH BUTTON DOWN
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showFlightBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFF6F8FA,
                    ), // ✅ same as page background
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: const Text(
                    "Not Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              SizedBox(
                width: double.infinity,
                height: height * 0.055,
                child: AppButton(
                  text: "Allow Location Access",
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
