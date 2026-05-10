import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:namari/src/features/pages/screen/home/widget/departure_date_bottonsheet.dart';
import 'package:namari/src/features/pages/screen/home/widget/search_flight_page.dart';
import 'package:namari/src/features/pages/screen/home/widget/departure_bottomsheet.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

/// =====================================================
/// SHOW BOTTOM SHEET
/// =====================================================
void showFlightBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return const _FlightBottomSheet();
    },
  );
}

/// =====================================================
/// STATEFUL WIDGET
/// =====================================================
class _FlightBottomSheet extends StatefulWidget {
  const _FlightBottomSheet({super.key});

  @override
  State<_FlightBottomSheet> createState() => _FlightBottomSheetState();
}

class _FlightBottomSheetState extends State<_FlightBottomSheet> {
  bool isToday = false;
  DateTime? selectedDate;

  /// ✅ FORMAT DATE (Fri, 8 May 2026)
  String formatDate(DateTime date) {
    return DateFormat('EEE, d MMM y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          _buildHeader(context),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -35),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildLocationSection(context),
                          const SizedBox(height: 16),
                          _buildDateSection(),
                          const SizedBox(height: 16),
                          _buildPassengerSection(),
                          const SizedBox(height: 16),
                          _buildClassSection(),
                          const SizedBox(height: 24),
                          _buildSearchButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= HEADER =================
  Widget _buildHeader(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: AssetImage(AppImages.background3),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18),
                ),
              ),
              Image.asset(AppImages.logo, width: 100),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset(AppImages.splash, width: width * 0.2),
              ),
            ],
          ),

          const SizedBox(height: 10),

          const Text(
            "Flights ticket",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            "Find your best flight ticket for traveling",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // ================= LOCATION =================
  Widget _buildLocationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: [
                Icon(Icons.flight_takeoff, color: Colors.grey),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Departure from",
                    style: TextStyle(fontSize: 16, color: AppColors.grey),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade300),

          GestureDetector(
            onTap: () {
              showDepartureBottomSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Row(
                children: [
                  const Icon(Icons.flight_land, color: Colors.grey),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Where are you going?",
                      style: TextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(1300),
                    ),
                    child: const Icon(Icons.sync_alt, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection() {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<DateTime>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const CustomDepartureSheet(),
        );

        if (result != null) {
          setState(() {
            selectedDate = result;
            isToday = false;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month, color: Colors.grey),
            const SizedBox(width: 12),

            Expanded(
              child: Text(
                isToday
                    ? "Today (${formatDate(DateTime.now())})"
                    : selectedDate != null
                    ? formatDate(selectedDate!)
                    : "Departure date",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            Switch(
              value: isToday,
              activeColor: Colors.green,
              onChanged: (v) {
                setState(() {
                  isToday = v;
                  selectedDate = v ? DateTime.now() : null;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= PASSENGER =================
  Widget _buildPassengerSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.people_outline, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "1 Adult, 0 child",
              style: TextStyle(color: AppColors.grey),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  // ================= CLASS =================
  Widget _buildClassSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.airline_seat_recline_normal, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Select class",
              style: TextStyle(color: AppColors.grey),
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  // ================= BUTTON =================
  Widget _buildSearchButton() {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.06,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchFlightPage()),
          );
        },
        icon: const Icon(Icons.search, color: Colors.white, size: 22),
        label: const Text(
          "Search Flight",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
