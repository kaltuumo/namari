import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/searchflight/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _PolicyCard(
            title: "General Ticket Policy",
            icon: Icons.confirmation_number_outlined,
            points: [
              "Ticket is issued under Maandeeq Air terms.",
              "Non-transferable ticket.",
              "Check-in 90 minutes before departure.",
              "Valid travel documents required.",
            ],
          ),
          const SizedBox(height: 16),

          const _PolicyCard(
            title: "Baggage Allowance",
            icon: Icons.luggage_outlined,
            points: [
              "Cabin: 7 kg allowed.",
              "Checked: 20 kg Business Class.",
              "Extra baggage fees apply.",
              "Dangerous goods prohibited.",
            ],
          ),
          const SizedBox(height: 16),

          const _PolicyCard(
            title: "Airline Responsibilities",
            icon: Icons.warning_amber_rounded,
            points: [
              "Compensation for airline delays.",
              "Not responsible for force majeure.",
              "Report baggage issues in 7 days.",
            ],
          ),
          const SizedBox(height: 16),

          const _PolicyCard(
            title: "Identification & Boarding",
            icon: Icons.contact_emergency_outlined,
            points: [
              "Valid ID required.",
              "Boarding closes 20 minutes before departure.",
            ],
          ),

          const SizedBox(height: 20),

          /// ================= BUTTON (NOW SCROLLS WITH PAGE) =================
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

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 10),
                Text(
                  "Add to wishlist",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _PolicyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> points;

  const _PolicyCard({
    required this.title,
    required this.icon,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Icon(icon, color: Colors.black87),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: points
                    .map((point) => _buildBulletPoint(point))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 6, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
