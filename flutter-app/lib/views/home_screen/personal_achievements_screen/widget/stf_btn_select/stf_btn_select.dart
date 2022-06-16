import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatefulButtonSelect extends StatefulWidget {
  const StatefulButtonSelect(
      {super.key,
      required this.isSelect,
      required this.title,
      required this.point});
  final bool isSelect;
  final String title;
  final int point;

  @override
  State<StatefulButtonSelect> createState() => _StatefulButtonSelectState();
}

class _StatefulButtonSelectState extends State<StatefulButtonSelect> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    setStateIsSelect() {
      setState(() {
        isSelect = !isSelect;
      });
    }

    return RaisedGradientButton(
      width: 103.w,
      height: 40.h,
      child: Text(
        isSelect ? 'Selected' : 'Select',
        style: TextConfigs.medium16.copyWith(
            color: isSelect ? AppColors.whiteColor : AppColors.oceanGreenColor),
      ),
      outline: isSelect ? false : true,
      gradient: isSelect
          ? const LinearGradient(
              colors: AppColors.gradientPrimary,
            )
          : const LinearGradient(
              colors: AppColors.gradientOutline,
            ),
      onPressed: setStateIsSelect,
    );
  }
}
