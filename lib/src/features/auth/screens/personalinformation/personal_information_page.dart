import 'package:flutter/material.dart';
import 'package:namari/src/app_navigator.dart';
import 'package:namari/src/features/auth/screens/personalinformation/widget/continue_bottomsheet.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';

enum Gender { male, female }

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPage();
}

class _ProfileInformationPage extends State<ProfileInformationPage> {
  final TextEditingController phoneController = TextEditingController();

  Gender? selectedGender;

  String? selectedLocation;
  String selectedCountryCode = '+252';

  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> locations = ["Mogadishu", "Nairobi"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back_ios_new_rounded),

              SizedBox(height: height * 0.025),

              const Text(
                "Profile Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Please complete the registration form first",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: height * 0.03),

              /// FIRST NAME
              _buildInput("First Name", "First Name"),

              /// LAST NAME
              _buildInput("Last Name", "Last Name"),

              /// EMAIL
              _buildInput("Email Address", "Enter Email"),

              /// PHONE
              const SizedBox(height: 10),
              const Text("Phone Number"),
              SizedBox(height: 16),

              Container(
                width: double.infinity,
                height: height * 0.055,
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
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
                            {'code': '+252', 'flag': '🇸🇴', 'name': 'Somalia'},
                            {'code': '+254', 'flag': '🇰🇪', 'name': 'Kenya'},
                            {
                              'code': '+251',
                              'flag': '🇪🇹',
                              'name': 'Ethiopia',
                            },
                            {'code': '+20', 'flag': '🇪🇬', 'name': 'Egypt'},
                          ].map<DropdownMenuItem<String>>((country) {
                            return DropdownMenuItem<String>(
                              value: country['code'],
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,

                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "${country['flag']} ${country['code']}",
                                  style: const TextStyle(fontSize: 16),
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
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ================= GENDER ROW =================
              Row(
                children: [
                  /// MALE
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.male
                              ? Colors.green.shade50
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedGender == Gender.male
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 28,
                              color: selectedGender == Gender.male
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            const Text("Male", style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// FEMALE
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.female
                              ? Colors.green.shade50
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedGender == Gender.female
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              Icons.female,
                              size: 28,
                              color: selectedGender == Gender.female
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Female",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// SAVE BUTTON
              Row(
                children: [
                  /// SKIP BUTTON
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppNavigator(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: const Center(
                          child: Text(
                            "Skip",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// CONTINUE BUTTON
                  Expanded(
                    child: AppButton(
                      text: "Continue",
                      onPressed: () {
                        ContinueBottomSheet.show(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// INPUT WIDGET
  Widget _buildInput(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
