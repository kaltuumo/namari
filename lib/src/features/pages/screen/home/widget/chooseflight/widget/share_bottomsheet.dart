import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

// --- SHOW BOTTOM SHEET ---
void showShareFlightsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const ShareBottomSheet(),
  );
}

// --- MAIN WIDGET ---
class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFC),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Share flights",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFE2E8F0)),
          const SizedBox(height: 20),

          _buildFlightTicketCard(width),

          const SizedBox(height: 24),

          _buildSocialMediaSection(),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.copy),
                label: const Text("Copy link"),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ---------------- FLIGHT CARD (HAGAAGSAN) ----------------
  Widget _buildFlightTicketCard(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Padding(
              padding: const EdgeInsets.all(18), // ✅ ONLY ONE PADDING
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // ✅ ADD THIS

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

                      const SizedBox(width: 4),

                      const Expanded(
                        child: Text(
                          "Mandeq Air",
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
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "06:00",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text("MGQ", style: TextStyle(color: Colors.grey)),
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
                                    children: List.generate(10, (index) {
                                      return Expanded(
                                        child: Container(
                                          height: 1,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          color: Colors.grey,
                                        ),
                                      );
                                    }),
                                  ),
                                ),

                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: Icon(
                                    Icons.flight,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),

                                Expanded(
                                  child: Row(
                                    children: List.generate(10, (index) {
                                      return Expanded(
                                        child: Container(
                                          height: 1,
                                          margin: const EdgeInsets.symmetric(
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
                          Text("NBO", style: TextStyle(color: Colors.grey)),
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 25,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF2563EB),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Icon(Iconsax.send_2, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET-KA WAQTIGA OO LA CASRIYEEYAY
  Widget _buildTime(String time, String code, CrossAxisAlignment alignment) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          alignment, // Bidix ama Midig u jiciir xogta si ay u dhegto geeska
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          code,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Widget _buildDashedLine() {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       return Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: List.generate(
  //           (constraints.maxWidth / 6).floor(),
  //           (_) => Container(
  //             width: 3,
  //             height: 3,
  //             decoration: const BoxDecoration(
  //               color: Color(0xFF94A3B8),
  //               shape: BoxShape.circle,
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // --- SOCIAL MEDIA SECTION ---
  Widget _buildSocialMediaSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSocialItem("WhatsApp", Icons.message, Colors.green),
          _buildSocialItem("Instagram", Icons.camera_alt, Colors.pink),
          _buildSocialItem("Facebook", Icons.facebook, Colors.blue),
          _buildSocialItem("X", Icons.close, Colors.black),
          _buildSocialItem("Telegram", Icons.telegram, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildSocialItem(String label, IconData icon, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Center(child: Icon(icon, color: iconColor, size: 24)),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
