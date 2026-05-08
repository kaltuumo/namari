import 'package:flutter/material.dart';

class SearchFlightPage extends StatelessWidget {
  const SearchFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Search Flight",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.tune, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// HEADER CARD (MGQ -> NBO)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  /// ROUTE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "MGQ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.flight_takeoff, color: Colors.blue),
                      Text(
                        "NBO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "28 Nov - 3 Dec • Business • 2 Travellers",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  /// DEPARTURE
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.flight, color: Colors.green),
                        SizedBox(width: 10),
                        Text("Departure flight"),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// FILTER + SORT
            Row(
              children: [
                Expanded(child: _actionBox(Icons.filter_list, "Filter")),
                const SizedBox(width: 12),
                Expanded(child: _actionBox(Icons.sort, "Sort by")),
              ],
            ),

            const SizedBox(height: 20),

            /// FLIGHT CARD
            Expanded(child: ListView(children: [_flightCard()])),
          ],
        ),
      ),
    );
  }

  /// FILTER / SORT BOX
  Widget _actionBox(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(title),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  /// FLIGHT CARD
  Widget _flightCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// AIRLINE
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.flight, color: Colors.white),
              ),
              const SizedBox(width: 10),
              const Text(
                "Maandeq Air",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Business",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// TIME
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "06:00",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "07:40",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("MGQ", style: TextStyle(color: Colors.grey)),
              Text("1h 40m • Direct", style: TextStyle(color: Colors.grey)),
              Text("NBO", style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 12),

          /// PRICE
          Row(
            children: const [
              Text(
                "\$160.00 / pax",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "\$220.00",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// FACILITIES
          const Text(
            "Facilities",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: const [
              _facility("Baggage 30kg"),
              _facility("Cabin 5kg"),
              _facility("Meal"),
              _facility("USB Port"),
            ],
          ),

          const SizedBox(height: 16),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text("CHOOSE FLIGHT"),
            ),
          ),
        ],
      ),
    );
  }
}

class _facility extends StatelessWidget {
  final String text;
  const _facility(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
