import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/icon_button.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/number_with_text/number_with_text.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/widget/music_card/music_card.dart';
import 'package:book_net/views/home_screen/personal_achievements_screen/widget/title_card/title_card.dart';
import 'package:book_net/views/home_screen/shop_screen/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalAchievementsScreen extends StatelessWidget {
  static const id = "PersonalAchievementsScreen";
  const PersonalAchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _onPressShopButton() {
      Navigator.pushNamed(context, ShopScreen.id);
    }

    final List<Widget> _barIcons = [
      CustomIconButton(
          icon: const Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.blackColor,
          ),
          color: AppColors.whiteColor,
          onPressed: _onPressShopButton),
      SizedBox(
        width: AppStyles.defaultMarginHorizontal,
      )
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: Bars(
          list: _barIcons,
          title: 'Your achievements',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  buildHeader(),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 450.h,
              // decoration: const BoxDecoration(color: AppColors.amazonColor),
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    const TabBar(
                      // <-- Your TabBar
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
                        // Tab(
                        //     icon: Text(
                        //   'Title',
                        //   style: TextConfigs.medium16
                        //       .copyWith(color: AppColors.oceanGreenColor),
                        // )),
                      ],
                    ),
                    SizedBox(
                      height: 400.h,
                      child: TabBarView(
                        // <-- Your TabBarView
                        children: [
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
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              )
                            ]),
                          ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      children: [
        DefaultCircleAvatar(
            width: 80.w, height: 80.h, imageUrl: CurrUserData().user!.imageUrl),
        SizedBox(
          height: 8.h,
        ),
        Text(
          CurrUserData().user!.alias,
          style: TextConfigs.bold16,
        ),
        Text(
          CurrUserData().user!.name,
          style: TextConfigs.regular14,
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 300.w,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Flexible(
                child: NumberWithText(
                  number: 33,
                  text: 'Your rank',
                ),
                flex: 1,
              ),
              Flexible(
                child: NumberWithText(
                  number: 33,
                  text: 'Current points',
                ),
                flex: 1,
              ),
              Flexible(
                child: NumberWithText(
                  number: 33,
                  text: 'Highest points',
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
