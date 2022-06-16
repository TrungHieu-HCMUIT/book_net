import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:book_net/views/home_screen/create_news_screen/create_news_screen.dart';
import 'package:book_net/views/home_screen/detail_guild_screen/widget/stf_button.dart';
import 'package:book_net/views/home_screen/feed_screen/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailGuildScreen extends StatelessWidget {
  static const id = "DetailGuildScreen";
  final GuildDto guild;
  DetailGuildScreen({super.key, required this.guild});

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    onPressedAddGuildshelf() {}
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars(
            title: 'Guild Detail',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  imageUrl: guild.imageUrl,
                  width: 360,
                  height: 360,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guild.name,
                        style: TextConfigs.bold18,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text(guild.memberList.length.toString(),
                              style: TextConfigs.baseBold
                                  .copyWith(color: AppColors.blackColor)),
                          Text(' members',
                              style: TextConfigs.regular12
                                  .copyWith(color: AppColors.blackColor)),
                        ],
                      ),
                      SizedBox(
                        height: AppStyles.defaultMarginVertical,
                      ),
                      Text(guild.description,
                          style: TextConfigs.regular12
                              .copyWith(color: AppColors.darkGrayColor)),
                    ],
                  ),
                ),
                StateFulButton(
                  guild: guild,
                ),
              ]),
        ));
  }

  List<Widget> _buildListItem(BuildContext context) {
    List<Widget> listItem = [];

    for (BaseNewsDto model in newsGuildTest) {
      listItem.add(NewsCard(
        news: model,
        screenType: NewsScreenType.feed,
      ));
    }

    return listItem;
  }

  void _navigateToCreateNewsScreen(BuildContext context) {
    Navigator.pushNamed(context, CreateNewsScreen.id);
  }
}
