import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:namari/src/features/pages/screen/home/home_page.dart';
import 'package:namari/src/features/pages/screen/orders/orders_page.dart';
import 'package:namari/src/features/pages/screen/profile/profile_page.dart';
import 'package:namari/src/features/pages/screen/rewards/rewards_page.dart';
import 'package:namari/src/features/pages/screen/spotlight/spotlight_page.dart';
import 'package:namari/src/utils/constant/colors.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key, this.initialIndex = 0});

  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      _NavigationController(initialIndex: initialIndex ?? 0),
    );

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return TextStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
              }
              return const TextStyle(color: Colors.grey, fontSize: 12);
            }),
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: AppColors.secondaryColor, size: 26);
              }
              return const IconThemeData(color: Colors.grey, size: 24);
            }),
          ),
          child: NavigationBar(
            height: 70,
            backgroundColor: AppColors.white,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.changePage(index);
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Iconsax.star),
                label: 'Spotlight',
              ),
              NavigationDestination(icon: Icon(Iconsax.card), label: 'Rewards'),
              NavigationDestination(
                icon: Icon(Iconsax.receipt),
                label: 'Orders',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------- CONTROLLER ----------------
class _NavigationController extends GetxController {
  _NavigationController({this.initialIndex = 0}) {
    selectedIndex.value = initialIndex;
  }

  final int initialIndex;

  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = const [
    HomePage(),
    SpotlightPage(),
    RewardsPage(),
    OrdersPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
