import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:flutter/cupertino.dart';

class StatefulButtonFollow extends StatefulWidget {
  const StatefulButtonFollow({super.key, required this.user});
  final UserDto user;

  @override
  State<StatefulButtonFollow> createState() => _StatefulButtonFollowState();
}

class _StatefulButtonFollowState extends State<StatefulButtonFollow> {
  bool isFollow = false;
//request api de lay gia tri follow o day
  @override
  Widget build(BuildContext context) {
    setStateIsFollow() {
      setState(() {
        isFollow = !isFollow;
      });
    }

    return RaisedGradientButton(
      child: Text(
        isFollow ? 'Follow' : 'Unfollow',
        style: TextConfigs.medium16.copyWith(
            color: isFollow ? AppColors.whiteColor : AppColors.oceanGreenColor),
      ),
      outline: isFollow ? false : true,
      gradient: isFollow
          ? const LinearGradient(
              colors: AppColors.gradientPrimary,
            )
          : const LinearGradient(
              colors: AppColors.gradientOutline,
            ),
      onPressed: setStateIsFollow,
    );
  }
}
