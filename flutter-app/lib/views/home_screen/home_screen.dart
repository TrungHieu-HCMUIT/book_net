import 'package:book_net/routes/app_routes.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/home_screen/achievement_screen/achievement_screen.dart';
import 'package:book_net/views/home_screen/book_screen/book_screen.dart';
import 'package:book_net/views/home_screen/feed_screen/feed_screen.dart';
import 'package:book_net/views/home_screen/guild_screen/guild_screen.dart';
import 'package:book_net/views/home_screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../configs/color_configs.dart';

class HomeScreen extends StatelessWidget {
  static const id = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarsItems(),
      confineInSafeArea: false,
      popActionScreens: PopActionScreensType.all,
      backgroundColor: AppColors.whiteColor,
      navBarHeight: 56.h,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      bottomScreenMargin: 56.h,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }

  List<Widget> _buildScreen() {
    return [
      FeedScreen(),
      const GuildScreen(),
      const BookScreen(),
      const AchievementScreen(),
      ProfileScreen(
        user: CurrUserData().user!,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    const icFeedPath = 'assets/icons/ic_feed.svg';
    const icGuildPath = 'assets/icons/ic_guild.svg';
    const icBookPath = 'assets/icons/ic_book.svg';
    const icAchievementPath = 'assets/icons/ic_achievement.svg';
    const icProfilePath = 'assets/icons/ic_profile.svg';

    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icFeedPath,
          color: AppColors.greenColor,
          height: 20.w,
          width: 18.w,
        ),
        inactiveIcon: SvgPicture.asset(
          icFeedPath,
          color: AppColors.grey2Color,
          height: 20.w,
          width: 18.w,
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icGuildPath,
          color: AppColors.greenColor,
          height: 24.w,
          width: 24.w,
        ),
        inactiveIcon: SvgPicture.asset(
          icGuildPath,
          color: AppColors.grey2Color,
          height: 24.w,
          width: 24.w,
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icBookPath,
          color: AppColors.greenColor,
          height: 24.w,
          width: 24.w,
        ),
        inactiveIcon: SvgPicture.asset(
          icBookPath,
          color: AppColors.grey2Color,
          height: 24.w,
          width: 24.w,
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icAchievementPath,
          color: AppColors.greenColor,
          height: 22.w,
          width: 14.w,
        ),
        inactiveIcon: SvgPicture.asset(
          icAchievementPath,
          color: AppColors.grey2Color,
          height: 22.w,
          width: 14.w,
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          icProfilePath,
          color: AppColors.greenColor,
          height: 24.w,
          width: 24.w,
        ),
        inactiveIcon: SvgPicture.asset(
          icProfilePath,
          color: AppColors.grey2Color,
          height: 24.w,
          width: 24.w,
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
    ];
  }
}
