import 'package:flutter/material.dart';
import 'package:namari/src/features/auth/screens/otp/otp_page.dart';

enum VerifyMethod { sms, whatsapp }

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
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "Change Verify Method",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 20),

                  /// SMS
                  PaymentItemWidget(
                    title: "Via SMS",
                    subtitle: "(+62).........808",
                    icon: Icons.sms,
                    selected: selected == VerifyMethod.sms,
                    onTap: () {
                      setState(() {
                        selected = VerifyMethod.whatsapp;
                      });

                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OtpPage()),
                      );
                    },
                  ),

                  /// WhatsApp
                  PaymentItemWidget(
                    title: "Via WhatsApp",
                    subtitle: "(+62).........808",
                    icon: Icons.chat,
                    selected: selected == VerifyMethod.whatsapp,
                    onTap: () {
                      setState(() {
                        selected = VerifyMethod.whatsapp;
                      });

                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OtpPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

/// =======================
/// ITEM WIDGET
/// =======================
class PaymentItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const PaymentItemWidget({
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.green : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: selected ? Colors.green.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.green),
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
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            Icon(
              selected ? Icons.check_circle : Icons.arrow_forward_ios,
              color: selected ? Colors.green : Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
