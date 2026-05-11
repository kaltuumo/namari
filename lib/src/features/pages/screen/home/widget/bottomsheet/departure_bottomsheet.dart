import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/bottomsheet/current_location_page.dart';

void showDepartureBottomSheet(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 12),
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 16),

            /// TITLE (LEFT ALIGNED FIXED)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Departure Location",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// CONTENT
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      _searchBar(),

                      const SizedBox(height: 16),

                      departureItemWidget(
                        title: "Use Current Location",
                        subtitle: "Turn On Location Access",
                        icon: Icons.my_location,
                        selected: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CurrentLocationPage(),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " Popular Departure",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      departureItemWidget(
                        title: "Mogadishu MGQ",
                        subtitle: "Aden Adde International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                      Row(
                        children: List.generate(
                          100,
                          (index) => Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      departureItemWidget(
                        title: "Hargeisa HGA",
                        subtitle: "Egal International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                      Row(
                        children: List.generate(
                          100,
                          (index) => Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      departureItemWidget(
                        title: "Nairobi NBO",
                        subtitle: "Jomo Kenyatta International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " Recently Location",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      departureItemWidget(
                        title: "Kismayo KMU",
                        subtitle: "Kismayo International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                      Row(
                        children: List.generate(
                          100,
                          (index) => Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      departureItemWidget(
                        title: "Baydhabo BIB",
                        subtitle: "Shatigadud International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                      Row(
                        children: List.generate(
                          100,
                          (index) => Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      departureItemWidget(
                        title: "Garowe GGR",
                        subtitle: "Gen Mohamed Abshir International Airport",
                        icon: Icons.location_on,
                        selected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

/// ================= SEARCH BAR =================
Widget _searchBar() {
  return TextField(
    decoration: InputDecoration(
      hintText: "Where you want to go?",
      prefixIcon: const Icon(Icons.search, size: 20),

      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    ),
  );
}

/// ================= ITEM WIDGET =================
class departureItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const departureItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Icon(icon, color: Colors.green, size: 18),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
