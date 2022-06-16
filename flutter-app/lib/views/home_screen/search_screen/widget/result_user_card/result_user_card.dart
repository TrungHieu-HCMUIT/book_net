import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/user_card/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultUserCard extends StatelessWidget {
  const ResultUserCard({super.key, required this.user});
  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => print('object' + user.alias)),
      child: Container(
        width: 274.w,
        height: 64.h,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          UserCard(
            user: user,
            nameColor: AppColors.grey2Color,
            aliasColor: AppColors.blackColor,
          ),
        ]),
      ),
    );
  }
}
