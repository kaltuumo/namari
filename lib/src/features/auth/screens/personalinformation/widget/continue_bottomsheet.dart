import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/successpage/success_page.dart';
import 'package:namari/src/utils/constant/colors.dart';

class ContinueBottomsheet {
  static void show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context); // close bottomsheet

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SuccessPage()),
            );
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            padding: EdgeInsets.all(width * 0.05),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Icon Container
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.11,
                  width: height * 0.11,
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.12),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.green, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "50%",
                      style: TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.035),

                /// Title
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Preparing Your Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: height * 0.015),

                      SizedBox(
                        width: 250, // 🔥 IMPORTANT: controls alignment
                        child: const Text(
                          "Please do not close this page or exit the app, "
                          "as your account is currently being created",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.grey,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
              ],
            ),
          ),
        );
      },
    );
  }
}
