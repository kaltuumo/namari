import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/choose_flight_page.dart';
import 'package:namari/src/features/pages/screen/home/widget/bottomsheet/filter_bottomsheet.dart';
import 'package:namari/src/features/pages/screen/home/widget/bottomsheet/sorted_bottomsheet.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class SearchFlightPage extends StatelessWidget {
  const SearchFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= APP BAR =================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  /// FLIGHT TITLE
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _topIcon(Icons.arrow_back_ios_new),
                          const Text(
                            "MGQ → NBO",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _topIcon(Icons.edit),
                        ],
                      ),

                      Text(
                        "28 Nov - 3 Dec  •  Business  •  2 Travellers",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// ================= DATE CARD =================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF0Ebe69),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flight_takeoff,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "01",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Departure flight",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "Friday, 28 November 2025",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ================= BODY =================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      /// TITLE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Flight",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "8 recommended",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// FILTERS
                      Row(
                        children: [
                          Expanded(
                            child: _filterButton(
                              icon: Icons.filter_alt_outlined,
                              title: "Filter",
                              onTap: () {
                                showFilterBottomSheet(context);
                              },
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: _filterButton(
                              icon: Icons.sort,
                              title: "Sort by",
                              onTap: () {
                                showSortedBottomSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(
                            18,
                          ), // ✅ ONLY ONE PADDING
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // ✅ ADD THIS

                            children: [
                              /// ================= AIRLINE =================
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Image.asset(
                                        AppImages.maandeeq,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  const Expanded(
                                    child: Text(
                                      "Maandeeq Air",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),

                                  const Icon(Icons.more_vert),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "GI 2023",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF019624),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "Business",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),

                              /// ================= TIME SECTION =================
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "06:00",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "MGQ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 6,
                                              width: 6,
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                            ),

                                            Expanded(
                                              child: Row(
                                                children: List.generate(10, (
                                                  index,
                                                ) {
                                                  return Expanded(
                                                    child: Container(
                                                      height: 1,
                                                      margin:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 1,
                                                          ),
                                                      color: Colors.grey,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),

                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 6,
                                              ),
                                              child: Icon(
                                                Icons.flight,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ),

                                            Expanded(
                                              child: Row(
                                                children: List.generate(10, (
                                                  index,
                                                ) {
                                                  return Expanded(
                                                    child: Container(
                                                      height: 1,
                                                      margin:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 1,
                                                          ),
                                                      color: Colors.grey,
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),

                                            Container(
                                              height: 6,
                                              width: 6,
                                              decoration: const BoxDecoration(
                                                color: Colors.grey,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 10),

                                        const Text(
                                          "1h 40m • Direct",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "07:40",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "NBO",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              /// ================= PRICE =================
                              Row(
                                children: [
                                  const Text(
                                    "\$160.00",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const Text(
                                    " / pax",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  const Spacer(),

                                  Text(
                                    "USD \$220.00",
                                    style: TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 18),

                              /// ================= FACILITIES =================
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Facilities",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Colors.grey.shade700,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              _facilityRow(
                                Icons.luggage_outlined,
                                "Baggage 30 kg, Cabin 5kg",
                              ),
                              const SizedBox(height: 10),
                              _facilityRow(Icons.tv, "In-flight entertainment"),
                              const SizedBox(height: 10),
                              _facilityRow(Icons.restaurant, "In-flight meal"),
                              const SizedBox(height: 10),
                              _facilityRow(Icons.power, "Power & USB Port"),

                              const SizedBox(height: 18),

                              /// ================= BUTTON =================
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: AppButton(
                                  text: "Choose Flight",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ChooseFlightPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= TOP ICON =================
  Widget _topIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(icon, size: 18),
    );
  }

  /// ================= FILTER BUTTON =================
  Widget _filterButton({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade700, size: 18),

            const SizedBox(width: 8),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),

            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade700,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  /// ================= FACILITY ROW =================
  Widget _facilityRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600, size: 18),

        const SizedBox(width: 14),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
