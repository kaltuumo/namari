import 'package:flutter/material.dart';
import 'package:namari/src/app_navigator.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

// --- FUNCTION TO SHOW THE BOTTOM SHEET ---
void showCurrentLocationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors
        .transparent, // Si ay u muuqato geesaha wareegsan (Rounded Corners)
    builder: (context) => const CurrentLocationBottomSheet(),
  );
}

// --- BOTTOM SHEET WIDGET ---
class CurrentLocationBottomSheet extends StatelessWidget {
  const CurrentLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: width * 0.09),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Wuxuu u weynaanayaa kaliya inta wax ku dhex jira ah
        children: [
          const SizedBox(height: 12),

          // Handle-ka yar ee sare ee Bottom Sheet-ka lagu yaqaan
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          SizedBox(height: height * 0.04),

          /// 🔹 CENTER CONTENT (Image & Text)
          Image.asset(
            AppImages.currentimage,
            height:
                height *
                0.18, // Si uusan aad ugu weynaan bottom sheet-ka dhexdiisa
            fit: BoxFit.contain,
          ),
          SizedBox(height: height * 0.03),
          const Text(
            "Find nearest airport",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: height * 0.04),

          /// 🔥 BUTTONS SECTION
          // 1. Not Now Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Wuxuu xirayaa bottom sheet-ka
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF6F8FA),
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

          SizedBox(height: height * 0.015),

          // 2. Allow Location Access Button
          SizedBox(
            width: double.infinity,
            height: height * 0.055,
            child: AppButton(
              text: "Allow Location Access",
              onPressed: () {
                Navigator.pop(context); // Marka hore xir bottom sheet-ka
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppNavigator()),
                );
              },
            ),
          ),

          SizedBox(
            height: height * 0.04,
          ), // Padding-ka hoose ee u dhexeeya badhanka iyo dhamaadka screen-ka
        ],
      ),
    );
  }
}
