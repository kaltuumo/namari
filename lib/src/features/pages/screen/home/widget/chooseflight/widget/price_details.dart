import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/searchflight/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Flight Card (Maandeeq Air)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade100),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Image.asset(
                              AppImages.maandeeq,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Maandeeq Air",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text("GI 2328", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF019624),
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
                  const Divider(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total ticket",
                            style: TextStyle(color: Colors.black54),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "\$160.00 ",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "/ pax",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "USD \$220.00",
                        style: TextStyle(
                          color: Color(0xFF00C853),
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              "Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // 2. Breakdown Section
            _buildPriceRow("Flight fare", "USD \$200.00"),
            _buildPriceRow("Airline taxes & fees", "USD \$10.00"),
            _buildPriceRow("Platform service fee", "USD \$10.00"),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: _DashedDivider(),
            ),

            _buildPriceRow("Total ticket", "USD \$220.00", isBold: true),

            const SizedBox(height: 25),
            const Text(
              "Notes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // 3. Notes Section
            _buildNoteItem(
              "The total amount includes airline taxes and service fees.",
            ),
            _buildNoteItem(
              "Extra baggage, seat selection, or in-flight upgrades may incur additional costs.",
            ),
            _buildNoteItem("Prices are shown in USD Dollar (USD)."),
            _buildNoteItem(
              "Currency rate may vary slightly depending on your payment provider.",
            ),

            const SizedBox(height: 24),

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
                      builder: (context) => const SearchFlightPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            /// ================= WISHLIST =================
            Container(
              width: double.infinity,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 10),
                  Text(
                    "Add to wishlist",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isBold ? Colors.black : Colors.grey,
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black87, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        40,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
    );
  }
}
