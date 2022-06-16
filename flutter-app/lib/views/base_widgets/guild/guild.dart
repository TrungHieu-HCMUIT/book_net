import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:book_net/views/home_screen/detail_guild_screen/detail_guild_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Guild extends StatelessWidget {
  const Guild({super.key, required this.guild, this.progress = -1});
  final GuildDto guild;
  final double progress;
  @override
  Widget build(BuildContext context) {
    onTap() {
      Navigator.pushNamed(context, DetailGuildScreen.id, arguments: guild);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220.h,
        padding: EdgeInsets.only(right: 8.h),
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: SizedBox(
          width: 140.h,
          height: 220.h,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  imageUrl: guild.imageUrl,
                  height: 140,
                  width: 140,
                  radius: AppStyles.radiusXss,
                ),
                Text(guild.name, style: TextConfigs.bold16),
                SizedBox(
                  height: 4.h,
                ),
                Text(guild.descrition,
                    style: TextConfigs.regular12
                        .copyWith(color: AppColors.darkGrayColor)),
                SizedBox(
                  height: 8.h,
                ),
              ]),
        ),
      ),
    );
  }
}
