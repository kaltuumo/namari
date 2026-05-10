import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namari/src/features/pages/screen/home/widget/flight_page.dart';
import 'package:namari/src/shared/app_button.dart';

// Hubi in path-kan uu sax yahay mashaariicdaada
// import 'package:namari/src/features/pages/screen/home/widget/flight_page.dart';
void showReturnDateSheet(BuildContext context) {
  showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF5F6FA),
    builder: (context) => const CustomReturnSheet(),
  );
}

class ReturnDateBottonsheet extends StatefulWidget {
  const ReturnDateBottonsheet({super.key});

  @override
  State<ReturnDateBottonsheet> createState() => _ReturnDateBottonsheetState();
}

class _ReturnDateBottonsheetState extends State<ReturnDateBottonsheet> {
  @override
  void initState() {
    super.initState();
    // Isla marka page-ka uu dhismo, waxaa la furayaa Bottom Sheet-ka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showReturnSheet();
    });
  }

  void _showReturnSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF5F6FA),
      builder: (context) => const CustomReturnSheet(),
    ).then((_) {
      // Marka Bottom Sheet-ka la xiro (X, Save, ama Back),
      // waxaa dib loogu laabanayaa FlightPage.
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(
        0xFFF5F6FA,
      ), // Background yar oo madow ah sheet-ka hoostiisa
      body: SizedBox.expand(),
    );
  }
}

class CustomReturnSheet extends StatelessWidget {
  const CustomReturnSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          // 1. Header: Title iyo Close Icon
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Return date",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black54,
                    size: 28,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // 2. Days of Week Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
                  .map(
                    (day) => Text(
                      day,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  )
                  .toList(),
            ),
          ),

          // 3. Calendar Body
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 20),
                    child: Text(
                      "November 2025",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildCalendarGrid(),
                ],
              ),
            ),
          ),

          // 4. Footer: Total, Leave/Return Box, Save Button
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // Xogta maalmaha bisha November 2025 (sida sawirkaaga)
    final List<String> days = [
      "26",
      "27",
      "28",
      "29",
      "30",
      "31",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30",
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        String day = days[index];
        bool isSelected = (index == 33); // Nov 28
        bool isSunday = (index % 7 == 0); // Tiirka koowaad waa Sunday (Casaan)
        bool isOtherMonth =
            index < 6 || index > 34; // Maalmaha bisha kale (Cawl)

        return Container(
          decoration: isSelected
              ? BoxDecoration(
                  color: const Color(0xFF00C569),
                  borderRadius: BorderRadius.circular(8),
                )
              : null,
          alignment: Alignment.center,
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? Colors.white
                  : (isSunday
                        ? Colors.red
                        : (isOtherMonth ? Colors.grey[350] : Colors.black87)),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Total : 1 Day",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          // Leave & Add Return Box
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Leave",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Nov 28, 2025",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 1, height: 40, color: Colors.grey.shade300),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Color(0xFF00C569),
                      size: 20,
                    ),
                    label: const Text(
                      "Add return",
                      style: TextStyle(
                        color: Color(0xFF00C569),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Save Button
          SizedBox(
            child: AppButton(
              text: "Save",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
