import 'package:book_net/configs/text_configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberWithText extends StatelessWidget {
  const NumberWithText({Key? key, required this.number, required this.text})
      : super(key: key);
  final int number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            number.toString(),
            style: TextConfigs.bold16,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            text,
            style: TextConfigs.regular12Gray,
          )
        ],
      ),
    );
  }
}
