import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/user_card/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderCard extends StatelessWidget {
  LeaderCard({
    super.key,
    required this.value,
    required this.user,
    required this.color,
    this.isFill = false,
    this.onTap,
  });
  final UserDto user;
  final int value;
  final bool isFill;
  final Color color;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isFill ? 24.w : 0.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              color: isFill ? color : AppColors.whiteColor),
          child: Row(children: [
            roundNumber(isFill ? AppColors.whiteColor : color,
                isFill ? color : AppColors.whiteColor, value),
            userWithPointCard(isFill ? AppColors.whiteColor : color)
          ]),
        ),
      ),
    );
  }

  Widget roundNumber(Color backgroundColor, Color textColor, int value) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: AppStyles.defaultMarginHorizontal,
          bottom: AppStyles.defaultMarginHorizontal,
          right: 8.w),
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: Text(
        value.toString(),
        style: TextConfigs.bold14.copyWith(color: textColor),
      ),
    );
  }

  Widget userWithPointCard(Color textColor) {
    return SizedBox(
      width: isFill ? 220.w : 270.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        UserCard(
          user: user,
          nameColor: isFill ? AppColors.lightGrayColor : AppColors.grey2Color,
          aliasColor: isFill ? AppColors.whiteColor : AppColors.blackColor,
        ),
        Text(user.currentPoint.toString(),
            style: TextConfigs.regular16.copyWith(
              color: textColor,
            ))
      ]),
    );
  }
}
