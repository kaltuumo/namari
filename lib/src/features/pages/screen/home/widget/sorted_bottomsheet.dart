import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:namari/src/features/pages/screen/home/widget/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';

void showSortedBottomSheet(BuildContext context) {
  int selectedIndex = 0;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF6F8FA),
    builder: (ctx) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Color(0xFFF6F8FA),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          children: [
            /// HANDLE BAR
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 16),

            /// TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sorting Your Results",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// LIST CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      SortedItemWidget(
                        title: "Lowest Price",
                        icon: Icons.circle_outlined,
                        selected: true,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Highest Price",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Earliest Departure",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Latest Departure",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Earliest Arrival",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Shortest duration",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      SortedItemWidget(
                        title: "Airline Name (A-Z)",
                        icon: Icons.circle_outlined,
                        selected: false,
                        onTap: () {},
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),

            /// ================= BOTTOM BUTTONS (FIXED SPACING) =================
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: AppButton(
                      text: "Apply",
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

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF6F8FA),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Resend ",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// ================= ITEM WIDGET =================
class SortedItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const SortedItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: selected ? Colors.green : AppColors.grey.withOpacity(0.2),
          ),

          color: selected ? Colors.green.withOpacity(0.08) : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : icon,
              color: selected ? Colors.green : Colors.grey,
              size: 25,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
