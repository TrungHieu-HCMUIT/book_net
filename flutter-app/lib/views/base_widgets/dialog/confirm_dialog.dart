import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> showMyDialog(BuildContext context, String title, String imageUrl,
    String content, String buttonText, Function action) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(16.h, 8.h, 16.h, 24.h),
        insetPadding: EdgeInsets.all(16.w),
        actionsPadding: EdgeInsets.fromLTRB(16.h, 8.h, 16.h, 8.h),
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppStyles.radiusXss))),
        title: Text(
          title,
          style: TextConfigs.bold24.copyWith(color: AppColors.oceanGreenColor),
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 8.h,
              ),
              imageUrl != ''
                  ? CustomImage(
                      imageUrl: imageUrl,
                      width: 112,
                      height: 160,
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                content,
                style: TextConfigs.regular16Grey,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedGradientButton(
            child: Text(
              buttonText,
              style: TextConfigs.medium16.copyWith(color: AppColors.whiteColor),
            ),
            gradient: const LinearGradient(
              colors: AppColors.gradientPrimary,
            ),
            onPressed: () {
              action();
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          TextButton(
            child: SizedBox(
                width: 296.w,
                child: Text(
                  'Cancel',
                  textAlign: TextAlign.center,
                  style: TextConfigs.medium16
                      .copyWith(color: AppColors.oceanGreenColor),
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
