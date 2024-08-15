// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_desk_workplace/common/base/pages/base_stateless_page.dart';
// import 'package:go_desk_workplace/common/base/pages/base_stateless_page_2.dart';
// import 'package:go_desk_workplace/common/constants/app_colors.dart';
// import 'package:go_desk_workplace/common/constants/app_themes.dart';
// import 'package:go_desk_workplace/common/widgets/texts/primary_text.dart';
// import 'package:go_desk_workplace/home/base/drawer_page.dart';
// import 'package:go_desk_workplace/home/pages/home_page.dart';
// import 'package:go_desk_workplace/home/pages/base_home_page.dart';
// import 'package:go_desk_workplace/home/pages/tickets_list_page.dart';
//
// import '../controller/base_controller.dart';
//
// class BaseHomePage extends StatefulWidget {
//   const BaseHomePage({super.key});
//
//   @override
//   State<BaseHomePage> createState() => _BaseHomePageState();
// }
//
// class _BaseHomePageState extends State<BaseHomePage> {
//   BaseHomePageController controller = Get.put(
//     BaseHomePageController(),
//   );
//
//   final myPages = [
//     const HomePage(),
//     const TicketPage(),
//     const DevicePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseStatelessPage2(
//       title: '',
//       leadingIcon: false,
//       onLeadingTap: () {},
//       headerBgColor: Colors.transparent,
//       action: [
//         const PrimaryText(
//           'Profile',
//           fontSize: 15,
//           fontColor: AppColors.black800Color,
//           fontWeight: AppThemes.fontRegular,
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         InkWell(
//           onTap: () {},
//           child: Container(
//             height: 50,
//             width: 50,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: AppColors.gray200Color,
//             ),
//             child: const Center(
//               child: PrimaryText(
//                 'P',
//                 fontWeight: AppThemes.fontSemiBold,
//                 fontColor: AppColors.primaryColor,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//       ],
//       drawer: const SideDrawer(),
//       body: Obx(
//         () => myPages[controller.myIndex.value],
//
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         elevation: 6,
//         type: BottomNavigationBarType.fixed,
//         selectedIconTheme: const IconThemeData(
//           color: AppColors.primaryColor,
//         ),
//         unselectedIconTheme: const IconThemeData(
//           color: AppColors.gray500Color,
//         ),
//         selectedItemColor: AppColors.primaryColor,
//         selectedLabelStyle: const TextStyle(
//           fontFamily: AppThemes.fontFamilyOpenSans,
//           fontSize: 17,
//           fontWeight: AppThemes.fontSemiBold,
//           color: AppColors.gray500Color,
//         ),
//         showUnselectedLabels: false,
//         onTap: (index) {
//           setState(() {
//             controller.myIndex.value = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               CupertinoIcons.tickets_fill,
//             ),
//             label: 'Tickets',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.devices,
//             ),
//             label: 'Devices',
//           ),
//         ],
//         currentIndex: controller.myIndex.value,
//       ),
//     );
//   }
// }
