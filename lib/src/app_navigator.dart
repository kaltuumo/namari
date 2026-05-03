// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:namari/src/utils/constant/colors.dart';

// class AppNavigator extends StatelessWidget {
//   const AppNavigator({super.key, this.initialIndex = 0});

//   final int? initialIndex;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(
//       _NavigationController(initialIndex: initialIndex ?? 0),
//     );

//     return Scaffold(
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//       bottomNavigationBar: Obx(
//         () => NavigationBarTheme(
//           data: NavigationBarThemeData(
//             indicatorColor: Colors.transparent, // ka saar highlight
//             labelTextStyle: MaterialStateProperty.resolveWith((states) {
//               if (states.contains(MaterialState.selected)) {
//                 return TextStyle(
//                   color: AppColors.secondaryColor, // Orange marka la doorto
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12,
//                 );
//               }
//               return const TextStyle(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12,
//               );
//             }),
//             iconTheme: MaterialStateProperty.resolveWith((states) {
//               if (states.contains(MaterialState.selected)) {
//                 return IconThemeData(color: AppColors.secondaryColor, size: 26);
//               }
//               return const IconThemeData(color: Colors.grey, size: 24);
//             }),
//           ),
//           child: NavigationBar(
//             height: 80,
//             backgroundColor: AppColors.white,
//             selectedIndex: controller.navIndex.value,
//             onDestinationSelected: (index) {
//               if (index == 2) {
//                 Get.snackbar(
//                   "Scan",
//                   "Scan button clicked",
//                   snackPosition: SnackPosition.BOTTOM,
//                 );
//                 return;
//               }
//               controller.changePage(index);
//             },
//             labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//             destinations: [
//               const NavigationDestination(
//                 icon: Icon(Iconsax.home),
//                 label: 'Home',
//               ),
//               const NavigationDestination(
//                 icon: Icon(Iconsax.box),
//                 label: 'Package',
//               ),
//               NavigationDestination(
//                 icon: Container(
//                   margin: const EdgeInsets.only(top: 18),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppColors.secondaryColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Iconsax.scan_barcode,
//                     color: Colors.white,
//                     size: 26,
//                   ),
//                 ),
//                 label: '',
//               ),
//               const NavigationDestination(
//                 icon: Icon(Iconsax.sms),
//                 label: 'Support',
//               ),
//               const NavigationDestination(
//                 icon: Icon(Iconsax.user),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// ---------------- CONTROLLER ----------------
// class _NavigationController extends GetxController {
//   _NavigationController({this.initialIndex = 0}) {
//     selectedIndex.value = initialIndex;
//     navIndex.value = initialIndex < 2 ? initialIndex : initialIndex + 1;
//   }

//   final int initialIndex;

//   /// index-ka dhabta ah ee pages
//   final RxInt selectedIndex = 0.obs;

//   /// index-ka NavigationBar (oo leh scan)
//   final RxInt navIndex = 0.obs;

//   final List<Widget> screens = const [
//     HomePage(), // 0
//     PackagePage(), // 1
//     SupportPage(), // 2
//     ProfilePage(), // 3
//   ];

//   void changePage(int index) {
//     // index > 2 → hal boos ka bood scan
//     selectedIndex.value = index > 2 ? index - 1 : index;
//     navIndex.value = index;
//   }
// }
