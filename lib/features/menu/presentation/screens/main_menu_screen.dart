import 'dart:io';

import 'package:case_study/features/add_space/presentation/screens/add_space_screen.dart';
import 'package:case_study/features/discover/presentation/screens/discover_screen.dart';
import 'package:case_study/features/my_booking/presentation/screens/my_booking_screen.dart';
import 'package:case_study/features/my_spaces/presentation/screens/my_spaces_screen.dart';
import 'package:case_study/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/menu_item.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final persistentTabController = PersistentTabController();
  final List<MenuItem> _menuItems = [
    MenuItem(title: AppLocalizations.of(Get.context!)!.discover, icon: menuIconDiscover),
    MenuItem(title: AppLocalizations.of(Get.context!)!.my_booking, icon: menuIconMyBooking),
    MenuItem(title: AppLocalizations.of(Get.context!)!.add, icon: menuIconPlus, color: AppColors.white),
    MenuItem(title: AppLocalizations.of(Get.context!)!.my_spaces, icon: menuIconMySpaces),
    MenuItem(title: AppLocalizations.of(Get.context!)!.profile, icon: menuIconProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _prepareTabView(),
    );
  }

  Widget _prepareTabView() {
    return PersistentTabView(
      context,
      controller: persistentTabController,
      screens: _buildScreens(),
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor ?? AppColors.primary,
      handleAndroidBackButtonPress: false,
      confineToSafeArea: true,
      padding: EdgeInsets.only(bottom: Platform.isAndroid ? 15 : 0),
      resizeToAvoidBottomInset: true,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: Platform.isAndroid ? 75 : 60,
      animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: false,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 200),
          )),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const DiscoverScreen(),
      const MyBookingScreen(),
      const AddSpaceScreen(),
      const MySpacesScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    List<PersistentBottomNavBarItem> items = [];
    for (MenuItem item in _menuItems) {
      items.add(PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          item.icon,
          height: 24,
          colorFilter: ColorFilter.mode(
            item.color ?? Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? AppColors.menuItemColorUnselected,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          item.icon,
          height: 24,
          colorFilter: ColorFilter.mode(
            item.color ?? Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? AppColors.menuItemColorUnselected,
            BlendMode.srcIn,
          ),
        ),
        iconSize: 24,
        title: item.title,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: AppFonts.menuTitleSize,
        ),
        activeColorPrimary: Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? AppColors.menuItemColorSelected,
        inactiveColorPrimary: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? AppColors.menuItemColorUnselected,
        activeColorSecondary: Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? AppColors.menuItemColorSelected,
        inactiveColorSecondary: AppColors.ratingYellowColor,
      ));
    }
    return items;
  }
}
