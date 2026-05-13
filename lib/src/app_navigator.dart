import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:namari/src/features/pages/screen/home/home_page.dart';
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
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
              }
              return const TextStyle(color: Colors.grey, fontSize: 12);
            }),
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: AppColors.primaryColor, size: 26);
              }
              return const IconThemeData(color: Colors.grey, size: 24);
            }),
          ),

          child: NavigationBar(
            height: 70,
            backgroundColor: AppColors.white,
            selectedIndex: controller.selectedIndex.value,

            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home5), label: 'Home'),
              NavigationDestination(
                icon: Icon(Iconsax.video),
                label: 'Spotlight',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.bag_2),
                label: 'Rewards',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.ticket),
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

class _NavigationController extends GetxController {
  _NavigationController({this.initialIndex = 0}) {
    selectedIndex.value = 0; // always HOME
  }

  final int initialIndex;

  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = const [
    HomePage(),
    _BlockedPage("Spotlight"),
    _BlockedPage("Rewards"),
    _BlockedPage("Orders"),
    _BlockedPage("Profile"),
  ];
}

class _BlockedPage extends StatelessWidget {
  final String title;

  const _BlockedPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: Colors.grey),
            const SizedBox(height: 10),
            Text(
              "$title Disabled",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Only Home page is active",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
