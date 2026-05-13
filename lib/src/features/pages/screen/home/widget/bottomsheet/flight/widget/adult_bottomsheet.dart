import 'package:flutter/material.dart';
import 'package:namari/src/features/pages/screen/home/widget/bottomsheet/flight/flight_page.dart';
import 'package:namari/src/shared/app_button.dart';

/// =====================================================
/// FUNCTION TO SHOW PASSENGER BOTTOM SHEET
/// =====================================================
void showPassengerBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => const PassengerBottomSheet(),
  );
}

class PassengerBottomSheet extends StatefulWidget {
  const PassengerBottomSheet({super.key});

  @override
  State<PassengerBottomSheet> createState() => _PassengerBottomSheetState();
}

class _PassengerBottomSheetState extends State<PassengerBottomSheet> {
  // Tirada dadka (State)
  int adults = 1;
  int children = 1;
  int infants = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Title and Close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Passenger info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 20, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // Sections
          _buildPassengerRow(
            "Adult",
            "Over the age of 12",
            adults,
            (val) => setState(() => adults = val),
          ),
          const _DashedDivider(),
          _buildPassengerRow(
            "Children",
            "Under the age of 12",
            children,
            (val) => setState(() => children = val),
          ),
          const _DashedDivider(),
          _buildPassengerRow(
            "Infant",
            "Under the age of 2",
            infants,
            (val) => setState(() => infants = val),
          ),

          const SizedBox(height: 30),

          // Final Summary text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Final passenger",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                "$adults Adult, $children Children",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Save Button
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Row builder for Adult, Child, Infant
  Widget _buildPassengerRow(
    String title,
    String subtitle,
    int count,
    Function(int) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          Row(
            children: [
              _buildCounterButton(Icons.remove, () {
                if (count > 0) onChanged(count - 1);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildCounterButton(Icons.add, () => onChanged(count + 1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    );
  }
}

/// =====================================================
/// CUSTOM DASHED DIVIDER
/// =====================================================
class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        100,
        (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
    );
  }
}
