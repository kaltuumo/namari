import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/searchflight/search_flight_page.dart';
import 'package:namari/src/shared/app_button.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF6F8FA),
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          bool direct = true;
          bool oneTransit = false;
          bool twoTransit = false;

          bool timeOne = true;
          bool timeTwo = false;

          return Container(
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: const BoxDecoration(
              color: Color(0xFFF6F8FA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),

            child: Column(
              children: [
                /// HANDLE
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                /// HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Filter your results",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          /// ================= TRANSIT =================
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Transit",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_up),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                filterItemWidget(
                                  title: "Direct",
                                  value: direct,
                                  onChanged: (v) {
                                    setState(() {
                                      direct = v!;
                                    });
                                  },
                                ),

                                const SizedBox(height: 18),

                                filterItemWidget(
                                  title: "1 Transit",
                                  value: oneTransit,
                                  onChanged: (v) {
                                    setState(() {
                                      oneTransit = v!;
                                    });
                                  },
                                ),

                                const SizedBox(height: 18),

                                filterItemWidget(
                                  title: "2+ Transits",
                                  value: twoTransit,
                                  onChanged: (v) {
                                    setState(() {
                                      twoTransit = v!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          /// ================= DEPARTURE =================
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Departure time",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_up),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                filterItemWidget(
                                  title: "12:00 - 14:00",
                                  value: timeOne,
                                  onChanged: (v) {
                                    setState(() {
                                      timeOne = v!;
                                    });
                                  },
                                ),

                                const SizedBox(height: 18),

                                filterItemWidget(
                                  title: "16:00 - 18:00",
                                  value: timeTwo,
                                  onChanged: (v) {
                                    setState(() {
                                      timeTwo = v!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// ================= APPLY BUTTON =================
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: AppButton(
                              text: "Apply Filter",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchFlightPage(),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 18),

                          /// ================= RESET =================
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                direct = false;
                                oneTransit = false;
                                twoTransit = false;
                                timeOne = false;
                                timeTwo = false;
                              });
                            },
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                color: Color(0xFF16C05B),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
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
    },
  );
}

/// ================= FILTER ITEM =================
class filterItemWidget extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  const filterItemWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),

        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF16C05B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
