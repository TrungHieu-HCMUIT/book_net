import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTextButton extends StatelessWidget {
  const IconWithTextButton(
      {Key? key, this.icon, this.text, required this.onTap})
      : super(key: key);
  final String? text;
  final String? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: key,
      width: double.infinity,
      height: AppStyles.heightButtonLg,
      // mainAxisSize: MainAxisSize.max,
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Row(
                children: [
                  Image.asset(
                    icon!,
                    width: 20.w,
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(text!,
                      style: TextConfigs.medium16
                          .copyWith(color: AppColors.darkGrayColor)),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}