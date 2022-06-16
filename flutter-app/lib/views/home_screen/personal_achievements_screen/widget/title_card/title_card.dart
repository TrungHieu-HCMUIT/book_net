import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/dialog/confirm_dialog.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/personal_achievements_screen.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/widget/stf_btn_select/stf_btn_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleCard extends StatelessWidget {
  const TitleCard(
      {super.key,
      required this.title,
      required this.point,
      this.isShop = false,
      required this.isSelect});
  final bool isSelect;
  final String title;
  final int point;
  final bool? isShop;
  @override
  Widget build(BuildContext context) {
    onPressTryIt() {
      Navigator.pushNamed(context, PersonalAchievementsScreen.id);
    }

    onPressGet() {
      showMyDialog(
          context,
          'Congratulations!',
          '',
          "You’ve got new title! \n “$title” into your bag!",
          "Lets try now!",
          onPressTryIt);
    }

    return Container(
      width: 328.w,
      height: 64.h,
      margin: EdgeInsets.all(12.h),

      // decoration: const BoxDecoration(color: AppColors.amazonColor),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextConfigs.regular16
                        .copyWith(color: AppColors.darkGrayColor),
                  ),
                  Text(
                    point.toString(),
                    style: TextConfigs.regular14
                        .copyWith(color: AppColors.grayColor),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                isShop == false
                    ? StatefulButtonSelect(
                        isSelect: isSelect,
                        title: title,
                        point: point,
                      )
                    : RaisedGradientButton(
                        width: 103.w,
                        height: 40.h,
                        child: Text(
                          'Get',
                          style: TextConfigs.medium16
                              .copyWith(color: AppColors.oceanGreenColor),
                        ),
                        outline: true,
                        gradient: const LinearGradient(
                          colors: AppColors.gradientOutline,
                        ),
                        onPressed: onPressGet,
                      ),
                SizedBox(
                  width: 24.w,
                ),
              ],
            )
          ]),
    );
  }
}
