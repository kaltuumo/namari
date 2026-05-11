import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/searchflight/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';
import 'package:namari/src/utils/constant/images.dart';

class FlightDetails extends StatefulWidget {
  const FlightDetails({super.key});

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            const SizedBox(height: 24),

            /// ================= BODY =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ================= AIRLINE CARD =================
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
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

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Maandeeq Air",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "GI 2328",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),

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
                          ),

                          Divider(color: Colors.grey.shade300),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _flightInfo("Aircraft Type", "Boeing 737-800"),
                                _flightInfo("Flight Type", "Direct"),
                                _flightInfo("Duration", "1h 50m"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// ================= TITLE =================
                    const Text(
                      "Airline flights details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// ================= FLIGHT DETAILS =================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// LEFT TIMES
                        Column(
                          children: const [
                            Text(
                              "06:00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "28 Nov",
                              style: TextStyle(color: Colors.grey),
                            ),

                            SizedBox(height: 455),

                            Text(
                              "7:40",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "28 Nov",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(width: 14),

                        /// CENTER LINE
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.flight,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),

                            Container(
                              width: 2,
                              height: 500,
                              color: Colors.green,
                            ),

                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 14),

                        /// RIGHT DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mogadishu (MGQ)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                "Aden Adde International Airport",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                "Terminal 3F",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 18),

                              /// ================= FACILITIES =================
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Facilities",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(height: 18),

                                    _facilityItem(
                                      Icons.luggage_outlined,
                                      "Baggage 30 kg",
                                    ),
                                    _facilityItem(
                                      Icons.work_outline,
                                      "Cabin Baggage 5kg",
                                    ),
                                    _facilityItem(
                                      Icons.live_tv_outlined,
                                      "In-flight entertainment",
                                    ),
                                    _facilityItem(
                                      Icons.restaurant_outlined,
                                      "In-flight meal",
                                    ),
                                    _facilityItem(
                                      Icons.power,
                                      "Power & USB Port",
                                    ),
                                    _facilityItem(
                                      Icons.airline_seat_recline_normal,
                                      "Seat pitch 32 inches",
                                    ),
                                    _facilityItem(
                                      Icons.event_seat_outlined,
                                      "3-3 seat configuration",
                                    ),
                                    _facilityItem(Icons.wifi_off, "No WiFi"),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              /// ================= ARRIVAL =================
                              const Text(
                                "Nairobi (NBO)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              const SizedBox(height: 6),

                              const Text(
                                "Jomo Kenyatta International Airport",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// ================= NOTES =================
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 16),

                        _BulletText(
                          text:
                              "Don’t be late — arrive early to breeze through security",
                        ),

                        SizedBox(height: 14),

                        _BulletText(
                          text:
                              "Keep your ID or passport handy, you’ll need it for check-in!",
                        ),

                        SizedBox(height: 14),

                        _BulletText(
                          text:
                              "Make sure your bags meet the airline’s cabin and baggage rules.",
                        ),

                        SizedBox(height: 14),

                        _BulletText(
                          text:
                              "Double-check your gate before boarding — it might change!",
                        ),
                      ],
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flightInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),

        const SizedBox(height: 6),

        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ],
    );
  }

  Widget _facilityItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.grey.shade600),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;

  const _BulletText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "• ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
