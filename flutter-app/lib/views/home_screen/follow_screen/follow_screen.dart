import 'dart:developer';

import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/profile_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/dto/user/user_simplified_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/user_card/user_card.dart';
import 'package:book_net/views/home_screen/profile_screen/widgets/stf_btn_follow/stf_btn_follow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowScreen extends StatelessWidget {
  static const id = "FollowScreen";
  const FollowScreen({super.key, required this.user, required this.type});
  final String type;
  final UserDto user;
  @override
  Widget build(BuildContext context) {
    UserSimplifiedDto userTest = UserSimplifiedDto(
        alias: 'babitwinkle',
        name: 'Yen Nhi',
        id: '001',
        imageUrl:
            'https://scontent.fsgn2-5.fna.fbcdn.net/v/t39.30808-1/285594331_2193449504141989_6670054528809654619_n.jpg?stp=dst-jpg_p160x160&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_ohc=BUrO8mWh3hEAX8Wew1a&_nc_ht=scontent.fsgn2-5.fna&oh=00_AT84b4WL3Ob48SLpAo1DmqiJnYaslBPQ2wwGwkR8bH5uLA&oe=62AF0049');
    List<UserSimplifiedDto> listUserTest = [
      userTest,
      userTest,
      userTest,
      userTest,
      userTest
    ];
    List<UserSimplifiedDto> listUser =
        type == Profile.follower ? user.followers : user.following;
    //thay listUser o tren xuong duoi khi lay api
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: Bars(
            title: type,
          ),
        ),
        body: ListView.builder(
            // scrollDirection: Axis.vertical,
            itemCount: listUserTest.length,
            // physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemBuilder: (context, index) =>
                _buildFollowCard(listUserTest[index])
            // _buildFollowCard(listUserTest[index]),
            ));
  }

  Widget _buildFollowCard(UserSimplifiedDto user) {
    log(user.alias);
    return Container(
      width: 100.w,
      height: 64.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        UserCard(
          followUser: user,
          nameColor: AppColors.grey2Color,
          aliasColor: AppColors.blackColor,
        ),
        StatefulButtonFollow(
          followUser: user,
          width: 105,
        )
      ]),
    );
  }
}
