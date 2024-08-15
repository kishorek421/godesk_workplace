import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/controllers/home/base_home_controller.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_icons.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';
import 'package:go_desk_workplace/common/widgets/side_drawer/drawer_page.dart';
import 'package:go_desk_workplace/pages/home/home_page.dart';
import 'package:go_desk_workplace/pages/tickets/tickets_list_page.dart';
import 'package:go_desk_workplace/pages/user_profile/user_profile_page.dart';

class BaseHomePage extends StatefulWidget {
  const BaseHomePage({super.key});

  @override
  State<BaseHomePage> createState() => _BaseHomePageState();
}

class _BaseHomePageState extends State<BaseHomePage> {
  BaseHomeController controller = Get.put(BaseHomeController());

  final baseHomePage = [
    HomePage(),
    const TicketsListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                AppIcons.hamburgerMenuIcon,
                width: 25,
                height: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(
                  const UserProfilePage(),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.gray500Color.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("P"),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: const SideDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.black800Color,
          selectedFontSize: 16,
          selectedLabelStyle: TextStyle(
            fontWeight: AppThemes.fontSemiBold,
          ),
          elevation: 2,
          onTap: (index) {
            setState(() {
              controller.myIndex.value = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.homeIconActive,
                width: 25,
                height: 25,
              ),
              icon: SvgPicture.asset(
                AppIcons.homeIcon,
                width: 25,
                height: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppIcons.ticketIconActive,
                width: 25,
                height: 25,
              ),
              icon: SvgPicture.asset(
                AppIcons.ticketIcon,
                width: 25,
                height: 25,
              ),
              label: 'Tickets',
            ),
          ],
          currentIndex: controller.myIndex.value,
        ),
        body: baseHomePage[controller.myIndex.value],
      ),
    );
  }
}
