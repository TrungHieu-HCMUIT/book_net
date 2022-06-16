import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      required this.user,
      this.aliasColor = AppColors.blackColor,
      this.nameColor = AppColors.grayColor});
  final UserDto user;
  final Color aliasColor;
  final Color nameColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      // padding:
      //     EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: Row(
        children: [
          DefaultCircleAvatar(
              width: 40.w, height: 40.h, imageUrl: user.imageUrl),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.smallMarginHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.alias,
                  style: TextConfigs.regular16.copyWith(color: aliasColor),
                ),
                Text(
                  user.name,
                  style: TextConfigs.regular14.copyWith(color: nameColor),
                ),
              ],
            ),
          ),
          // SvgPicture.asset('assets/icons/ic_horizontal_eclipse.svg'),
        ],
      ),
    );
  }
}
