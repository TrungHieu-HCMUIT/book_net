import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/pojo/news/base_news_pojo.dart';
import 'package:book_net/views/home_screen/feed_screen/news.dart';
import 'package:flutter/material.dart';

import '../../../configs/color_configs.dart';
import '../../../configs/style_configs.dart';
import '../../../pojo/news/post_news_pojo.dart';
import '../../base_widgets/bar/bar.dart';
import '../../base_widgets/button/raised_gradient_button.dart';

class FeedScreen extends StatelessWidget {
  static const id = "FeedScreen";
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: const Bars(
          title: 'Newfeed',
          leading: SizedBox(),
        ),
      ),
      // TODO: Fix here, it must be infinity list
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: _buildListItem(),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.defaultMarginHorizontal,
              vertical: AppStyles.defaultMarginVertical),
          child: Text(
            "Hi, Trung Hieu! Let's explore something new!",
            style: TextConfigs.bold20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.defaultMarginHorizontal),
          child: RaisedGradientButton(
              child: Text(
                'Create a post',
                style:
                    TextConfigs.medium16.copyWith(color: AppColors.whiteColor),
              ),
              gradient: const LinearGradient(
                colors: <Color>[
                  AppColors.green1Color,
                  AppColors.green2Color,
                ],
              ),
              onPressed: () {}),
        ),
      ],
    );
  }

  List<Widget> _buildListItem() {
    List<Widget> listItem = [];

    for (BaseNewsPojo model in newsListTest) {
      listItem.add(NewsCard(news: model));
    }

    listItem.insert(0, _buildHeader());
    return listItem;
  }

  void _navigateToNewsDetailScreen() {}
}
