import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/signin/widget/bottomsheet/verify_method_bottomsheet.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController phoneController = TextEditingController();
  String selectedCountryCode = '+252'; // default Somalia
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.09,
              vertical: height * 0.06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          AppImages.logo,
                          color: AppColors.green,
                          width: width * 0.6,
                          height: height * 0.09,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: height * 0.01),

                      const Text(
                        "Login Or Register!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Create Your Account Or Login \n with Your Phone Number",
                        textAlign: TextAlign.center, // ⭐ IMPORTANT
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.04),

                /// Phone label
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black, // ✅ Use AppColors
                  ),
                ),

                SizedBox(height: height * 0.01),

                /// Phone input with multiple countries
                /// Phone input with multiple countries but same design
                Container(
                  width: double.infinity,
                  height: height * 0.055,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      DropdownButton<String>(
                        value: selectedCountryCode,
                        underline: const SizedBox(),

                        icon:
                            const SizedBox(), // ⭐ removes dropdown icon completely

                        items:
                            [
                              {
                                'code': '+252',
                                'flag': '🇸🇴',
                                'name': 'Somalia',
                              },
                              {'code': '+254', 'flag': '🇰🇪', 'name': 'Kenya'},
                              {
                                'code': '+251',
                                'flag': '🇪🇹',
                                'name': 'Ethiopia',
                              },
                              {'code': '+20', 'flag': '🇪🇬', 'name': 'Egypt'},
                            ].map((country) {
                              return DropdownMenuItem<String>(
                                value: country['code'],

                                child: Text(
                                  "${country['flag']} ${country['code']}",
                                  style: const TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }).toList(),

                        onChanged: (value) {
                          setState(() {
                            selectedCountryCode = value!;
                          });
                        },
                      ),
                      Container(
                        height: 2,
                        width: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        color: AppColors.grey.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: AppColors.grey),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                /// Send Code Button
                SizedBox(
                  width: double.infinity,
                  height: height * 0.05,
                  child: AppButton(
                    text: "Continue",
                    onPressed: () {
                      verifyMethodBottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
