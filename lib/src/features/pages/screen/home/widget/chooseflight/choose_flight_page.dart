import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/flight_details.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/policy_page.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/price_details.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/refund_page.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/rescedule_page.dart';
import 'package:namari/src/features/pages/screen/home/widget/chooseflight/widget/share_bottomsheet.dart';

class ChooseFlightPage extends StatefulWidget {
  const ChooseFlightPage({super.key});

  @override
  State<ChooseFlightPage> createState() => _ChooseFlightPageState();
}

class _ChooseFlightPageState extends State<ChooseFlightPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton(Icons.arrow_back_ios_new),

                  const Column(
                    children: [
                      Text(
                        "Maandeeq Air",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "MGQ-NBO • 1h 40m • Direct",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),

                  _iconButton(
                    Icons.share_outlined,
                    onTap: () {
                      showShareFlightsBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// ================= TABS =================
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _tabItem("Flight details", 0),
                    _tabItem("Price details", 1),
                    _tabItem("Policy", 2),
                    _tabItem("Refund", 3),
                    _tabItem("Reschedule", 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// ================= CONTENT =================
            Expanded(child: _buildTabContent()),
          ],
        ),
      ),
    );
  }

  /// ================= TAB CONTENT =================
  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return const FlightDetails();

      case 1:
        return const PriceDetails();

      case 2:
        return const PolicyPage();

      case 3:
        return const RefundPage();
      case 4:
        return const ReschedulePage();
      default:
        return const FlightDetails();
    }
  }

  /// ================= TAB ITEM =================
  Widget _tabItem(String title, int index) {
    final isActive = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.green : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            if (isActive)
              Container(
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Icon(icon),
      ),
    );
  }
}
