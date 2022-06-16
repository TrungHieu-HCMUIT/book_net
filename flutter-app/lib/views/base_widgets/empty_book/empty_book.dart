import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/color_configs.dart';
import '../../../configs/text_configs.dart';

class EmptyBook extends StatelessWidget {
  const EmptyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        const Icon(
          Icons.menu_book_rounded,
          color: AppColors.grayColor,
          size: 70,
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          'There is no book at all',
          style: TextConfigs.regular16.copyWith(
            color: AppColors.grey1Color,
          ),
        )
      ],
    );
  }
}
