import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(
                  Iconsax.setting_2,
                  size: 20,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader("TODAY"),
          const NotificationTile(
            category: "Booking Updates",
            time: "2h ago",
            title: "Flight booking confirmed",
            subtitle:
                "Your flight to Singapore (SIN) is confirmed. Get ready for your trip on Nov 12, 07:30 AM",
            icon: Iconsax.airplane,
            iconColor: Colors.green,
            isUnread: false,
          ),
          const NotificationTile(
            category: "Promotions & Offers",
            time: "2.5h ago",
            title: "Extra 8% OFF for App Users",
            subtitle:
                "Save more on your next flight booking. Use code FLY8 before Nov 30.",
            icon: Iconsax.ticket_discount,
            iconColor: Colors.green,
            isUnread: true,
          ),
          const NotificationTile(
            category: "System & Account",
            time: "4h ago",
            title: "New Login Detected",
            subtitle:
                "Your account was accessed from a new device: MacBook Air • Jakarta, ID. If this wasn't you, r...",
            icon: Iconsax.login,
            iconColor: Colors.green,
            isUnread: false,
          ),
          const SizedBox(height: 20),
          _buildSectionHeader("YESTERDAY"),
          const NotificationTile(
            category: "Booking Updates",
            time: "08:00 pm",
            title: "It's almost check-in time!",
            subtitle:
                "Your stay at Marina Bay Sands starts tomorrow at 2:00 PM. Don't forget your ID...",
            icon: Iconsax.house,
            iconColor: Colors.green,
            isUnread: true,
          ),
          const NotificationTile(
            category: "Booking Update",
            time: "12:00 pm",
            title: "Your Maandeeq Air flight is booked!",
            subtitle:
                "Your booking for flight QZ182 from Jakarta (CGK) to Bali (DPS) on Nov 20, 2025 has...",
            icon: Iconsax.status,
            iconColor: Colors.blue,
            isUnread: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String category;
  final String time;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;

  const NotificationTile({
    super.key,
    required this.category,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.isUnread,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text("•", style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          // Unread Dot
          if (isUnread)
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 5),
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
