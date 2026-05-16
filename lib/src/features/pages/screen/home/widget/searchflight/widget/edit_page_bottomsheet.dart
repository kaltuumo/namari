import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:namari/src/features/pages/screen/home/widget/searchflight/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';

class EditSearchBottomSheet extends StatelessWidget {
  const EditSearchBottomSheet({super.key});

  // Function-kan ayaa looga wacaa meesha aad rabto inay ka soo baxdo
  static void show() {
    Get.bottomSheet(
      const EditSearchBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: Title iyo Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Edit your search",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 1. Location Selection (Mogadishu to Nairobi)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Column(
                  children: [
                    _buildInputField(Iconsax.airplane, "Mogadishu (MGQ)"),
                    const Divider(height: 1, indent: 50),
                    _buildInputField(Iconsax.airplane, "Nairobi (NBO)"),
                  ],
                ),
                // Swap Button
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Iconsax.arrow_3,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // 2. Date Selection (Departure & Return)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                _buildInputField(
                  Iconsax.calendar_1,
                  "Sat, 28 Nov 2025",
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Return?",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Switch(
                        value: true,
                        onChanged: (v) {},
                        activeColor: const Color(0xFF00C569),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, indent: 50),
                _buildInputField(Iconsax.calendar_1, "Thu, 3 Dec 2025"),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // 3. Passengers & Class
          _buildSelectableField(Iconsax.people, "1 Adult, 1 child"),
          const SizedBox(height: 15),
          _buildSelectableField(Iconsax.status_up, "Business"),
          const SizedBox(height: 25),

          // 4. Save Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: AppButton(
              text: "Save",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchFlightPage(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Input Field Helper
  Widget _buildInputField(IconData icon, String text, {Widget? suffix}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          if (suffix != null) suffix,
        ],
      ),
    );
  }

  // Dropdown/Selectable Field Helper
  Widget _buildSelectableField(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }
}
