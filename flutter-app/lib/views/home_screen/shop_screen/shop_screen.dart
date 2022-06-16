import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/widget/music_card/music_card.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/widget/title_card/title_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopScreen extends StatelessWidget {
  static const id = "ShopScreen";

  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars(
            title: 'Shop Screen',
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 50,
            child: AppBar(
              elevation: 0,
              backgroundColor: AppColors.whiteColor,
              bottom: const TabBar(
                indicatorColor: AppColors.amazonColor,
                labelColor: AppColors.amazonColor,
                unselectedLabelColor: AppColors.oceanGreenColor,
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.card_membership_rounded,
                    color: AppColors.amazonColor,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.music_note_rounded,
                    color: AppColors.amazonColor,
                  )),
                ],
              ),
            ),
          ),

          // create widgets for each tab bar here
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                SingleChildScrollView(
                  child: Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listTitle.length,
                      itemBuilder: (context, index) => TitleCard(
                        title: listTitle[index],
                        point: listPoint[index],
                        isSelect: listSelect[index],
                        isShop: true,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ]),
                ),

                // second tab bar viiew widget
                SingleChildScrollView(
                  child: Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.manual,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listTitle.length,
                      itemBuilder: (context, index) => MusicCard(
                        name: listMusic[index],
                        author: listMusicAuthor[index],
                        points: listPoint[index].toString(),
                        isShop: true,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
