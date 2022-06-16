import 'package:book_net/configs/profile_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/home_screen/follow_screen/follow_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberWithText extends StatelessWidget {
  const NumberWithText(
      {Key? key,
      required this.number,
      required this.text,
      this.user,
      this.type})
      : super(key: key);
  final int number;
  final String text;
  final UserDto? user;

  final String? type;
  @override
  Widget build(BuildContext context) {
    onTap() {
      type == Profile.following
          ? Navigator.of(context)
              .pushNamed(FollowScreen.id, arguments: [user, Profile.following])
          : type == Profile.follower
              ? Navigator.of(context).pushNamed(FollowScreen.id,
                  arguments: [user, Profile.follower])
              : {};
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
