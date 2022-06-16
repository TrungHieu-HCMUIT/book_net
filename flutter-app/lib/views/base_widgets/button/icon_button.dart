import 'package:book_net/configs/color_configs.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      required this.color,
      required this.onPressed,
      this.background = AppColors.whiteColor})
      : super(key: key);
  final Widget icon;
  final Color color;
  final Color? background;

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            color: color,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
