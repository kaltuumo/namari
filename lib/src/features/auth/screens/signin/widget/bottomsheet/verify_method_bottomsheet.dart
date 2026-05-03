import 'package:flutter/material.dart';
import 'package:namari/src/shared/app_button.dart';
import 'package:namari/src/utils/constant/images.dart';

enum VerifyMethod { waafi, premier, edahab }

Future<VerifyMethod?> verifyMethodBottomSheet(BuildContext context) {
  VerifyMethod? selected;

  return showModalBottomSheet<VerifyMethod>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 56,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        "Payment Methods",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    PaymentItemWidget(
                      title: "Waafi",
                      subtitle: "EVC | Jeeb | Sahal | Zad",
                      selected: selected == VerifyMethod.waafi,
                      onTap: () =>
                          setState(() => selected = VerifyMethod.waafi),
                      imagePath: AppImages.waafi,
                      imageSize: 28,
                    ),
                    PaymentItemWidget(
                      title: "Premier Bank",
                      subtitle: "Preimier Bank or Wallet To Pay",
                      selected: selected == VerifyMethod.premier,
                      onTap: () =>
                          setState(() => selected = VerifyMethod.premier),
                      imagePath: AppImages.premier,
                      imageSize: 28,
                    ),
                    PaymentItemWidget(
                      title: "Dahabshiil",
                      subtitle: "Use Dahabshiil Bank or Edahab To Pay",
                      selected: selected == VerifyMethod.edahab,
                      onTap: () =>
                          setState(() => selected = VerifyMethod.edahab),
                      imagePath: AppImages.edahab,
                      imageSize: 28,
                    ),
                    const SizedBox(height: 22),
                    AppButton(
                      text: "Confirm Payment",
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ShipmentSuccessPage(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

class PaymentItemWidget extends StatelessWidget {
  final String title, subtitle;
  final bool selected;
  final VoidCallback onTap;
  final String? imagePath;
  final double imageSize;

  const PaymentItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    this.imagePath,
    this.imageSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFF3E0) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.orange : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: imagePath != null
                    ? Image.asset(
                        imagePath!,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.account_balance_wallet,
                        color: selected ? Colors.orange : Colors.black,
                        size: imageSize,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_off,
              color: selected ? Colors.orange : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
