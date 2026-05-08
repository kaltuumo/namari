import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/flight_page.dart';
import 'package:namari/src/utils/constant/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerSection(),
              const SizedBox(height: 15),
              _searchBar(),
              const SizedBox(height: 15),
              _menuGrid(context),
              const SizedBox(height: 15),
              _bannerSection(),
              const SizedBox(height: 20),
              _upcomingFlights(),
            ],
          ),
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _headerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB2DFDB), Color(0xFFE0F2F1)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Welcome, Mohamed",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              Row(
                children: [
                  _iconBox(Icons.card_giftcard),

                  const SizedBox(width: 10),

                  Stack(
                    children: [
                      _iconBox(Icons.notifications),

                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            "12",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Icon(Icons.wb_sunny, color: Colors.orange),
              SizedBox(width: 5),
              Text("28°C"),
              SizedBox(width: 10),
              Text("Sunny"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 20),
    );
  }

  // ================= SEARCH =================
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Where you want to go?",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ================= MENU =================
  Widget _menuGrid(BuildContext context) {
    final items = [
      {"icon": Icons.flight, "title": "Flight"},
      {"icon": Icons.inventory_2, "title": "Cargo"},
      {"icon": Icons.hotel, "title": "Hotel", "tag": "Soon"},
      {"icon": Icons.description, "title": "Visa"},
      {"icon": Icons.apps, "title": "More", "tag": "NEW"},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: items.map((item) {
          return GestureDetector(
            onTap: () {
              /// FLIGHT CLICK
              if (item["title"] == "Flight") {
                showFlightBottomSheet(context);
              }
            },

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        item["icon"] as IconData,
                        color: Colors.green,
                      ),
                    ),

                    if (item.containsKey("tag"))
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: item["tag"] == "NEW"
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item["tag"] as String,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  item["title"] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= BANNER =================
  Widget _bannerSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),

        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.maincontent, fit: BoxFit.cover),
            ),

            Positioned(
              right: 40,
              bottom: 20,

              child: Image.asset(
                AppImages.logo,
                width: 160,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= UPCOMING FLIGHTS =================
  Widget _upcomingFlights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),

          child: Text(
            "Upcoming Flights",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 160,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [_flightCard(), _flightCard()],
          ),
        ),
      ],
    );
  }

  Widget _flightCard() {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: const [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFFE8F5E9),

                    child: Icon(Icons.flight, size: 14, color: Colors.green),
                  ),

                  SizedBox(width: 6),

                  Text(
                    "Star Airlines",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              Icon(Icons.more_vert, size: 18),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: const [
              Text("08:00", style: TextStyle(fontWeight: FontWeight.bold)),

              Icon(Icons.flight_takeoff, size: 18, color: Colors.grey),

              Text("09:30", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: const [
              Text("MGQ", style: TextStyle(color: Colors.grey)),

              Text("HGA", style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 6),

          const Center(
            child: Text(
              "1h 30m • Direct",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                "\$160.00 / pax",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 35,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),

                  child: const Text("Book Now"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
