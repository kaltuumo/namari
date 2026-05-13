import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/bottomsheet/flight/flight_page.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/colors.dart';

/// ================= SHOW BOTTOM SHEET =================
void showSelectClassBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFF6F8FA),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (ctx) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              /// HANDLE BAR
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 16),

              /// TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Flight Class",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LIST
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    SelectClassItemWidget(title: "Economic", selected: true),
                    SelectClassItemWidget(
                      title: "Premium Economic",
                      selected: false,
                    ),
                    SelectClassItemWidget(title: "Business", selected: false),
                    SelectClassItemWidget(
                      title: "First Class",
                      selected: false,
                    ),
                  ],
                ),
              ),

              /// BUTTON (NOW INSIDE SAME PADDING)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: AppButton(
                  text: "Save",
                  onPressed: () {
                    showFlightBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// ================= ITEM WIDGET =================
class SelectClassItemWidget extends StatelessWidget {
  final String title;
  final bool selected;

  const SelectClassItemWidget({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? Colors.green : AppColors.grey.withOpacity(0.2),
        ),
        color: selected ? Colors.green.withOpacity(0.08) : null,
      ),
      child: Row(
        children: [
          Icon(
            selected ? Icons.check_circle : Icons.circle_outlined,
            color: selected ? Colors.green : Colors.grey,
            size: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
