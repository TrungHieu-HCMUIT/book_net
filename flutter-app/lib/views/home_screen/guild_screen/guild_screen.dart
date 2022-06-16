import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/guild/guild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuildScreen extends StatelessWidget {
  static const id = "GuildScreen";
  const GuildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: const Bars(
          title: 'Guild',
          leading: SizedBox(),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My guilds', style: TextConfigs.bold18),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listGuild.length,
                  itemBuilder: (context, i) {
                    return Guild(
                      guild: listGuild[i],
                    );
                  }),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text('Explore some guilds', style: TextConfigs.bold18),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listGuild.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    child: Guild(
                      guild: listGuild[i],
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
