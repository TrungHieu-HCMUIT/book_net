import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';

class Bars extends StatelessWidget {
  const Bars({
    Key? key,
    this.title,
    this.dotStepper,
    this.widget,
    List<Widget>? list,
    this.leading,
  })  : _list = list,
        super(key: key);

  final String? title;
  final Widget? widget;

  final List<Widget>? _list;
  final Widget? leading;
  final DotStepper? dotStepper;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      bottomOpacity: 0.0,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: Image.asset(
              'assets/icons/left-actionable.png',
              width: 24.w,
              height: 24.h,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      // title: dotStepper ?? title,
      title: widget ??
          (dotStepper ?? Text(title ?? "", style: TextConfigs.bold18)),
      centerTitle: true,
      actions: _list,
    );
  }
}
