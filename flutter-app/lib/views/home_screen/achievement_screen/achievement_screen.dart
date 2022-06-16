import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/home_screen/achievement_screen/widget/empty_leader_board/empty_leader_board.dart';
import 'package:book_net/views/home_screen/achievement_screen/widget/leader_card.dart/leader_card.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/personal_achievements_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementScreen extends StatelessWidget {
  static const id = "AchievementScreen";
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserDto> listUserLeader = [
      userTestModel,
      userTestModel,
      userTestModel,
      userTestModel,
      userTestModel
    ];
    onTap(BuildContext context) {
      Navigator.of(context).pushNamed(PersonalAchievementsScreen.id);
    }

    Widget listLeaderBoard() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: listUserLeader.length,
          itemBuilder: (context, index) => LeaderCard(
              color: index == 0
                  ? AppColors.metallicBlueColor
                  : index == 1
                      ? AppColors.zompColor
                      : index == 2
                          ? AppColors.oceanGreenColor
                          : AppColors.lightGreenColor,
              value: index + 1,
              user: listUserLeader[index]));
    }

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: const Bars(
          title: 'Achivement',
          leading: SizedBox(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text('Ranking', style: TextConfigs.bold18),
          ),
          SizedBox(
            height: 16.h,
          ),
          listUserLeader.isEmpty ? const EmptyLeaderBoard() : listLeaderBoard(),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.all(24.h),
            child: Text('Your rank', style: TextConfigs.bold18),
          ),
          LeaderCard(
            value: 123,
            user: userTestModel,
            color: AppColors.oceanGreenColor,
            isFill: true,
            onTap: () =>
                Navigator.of(context).pushNamed(PersonalAchievementsScreen.id),
          )
        ],
      ),
    );
  }
}
