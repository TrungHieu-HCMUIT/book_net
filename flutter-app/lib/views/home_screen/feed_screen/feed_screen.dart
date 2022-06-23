import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/feed_bloc/feed_bloc.dart';
import 'package:book_net/view_models/feed_bloc/feed_event.dart';
import 'package:book_net/view_models/feed_bloc/feed_state.dart';
import 'package:book_net/view_models/status.dart';
import 'package:book_net/views/home_screen/create_news_screen/create_news_screen.dart';
import 'package:book_net/views/home_screen/feed_screen/news.dart';
import 'package:book_net/views/home_screen/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/color_configs.dart';
import '../../../configs/style_configs.dart';
import '../../../view_models/user/curr_user.dart';
import '../../base_widgets/bar/bar.dart';
import '../../base_widgets/button/icon_button.dart';
import '../../base_widgets/button/raised_gradient_button.dart';

class FeedScreen extends StatelessWidget {
  static const id = "FeedScreen";
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _barIcons = [
      CustomIconButton(
          icon: Image.asset('assets/icons/ic_search.png'),
          color: AppColors.whiteColor,
          onPressed: () => {
                Navigator.pushNamed(context, SearchScreen.id),
              }),
      SizedBox(
        width: AppStyles.defaultMarginHorizontal,
      )
    ];
    return BlocProvider<FeedBloc>(
        create: (context) => FeedBloc(),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, AppStyles.appBarHeight),
            child: Bars(
              title: 'Newfeed',
              list: _barIcons,
              leading: const SizedBox(),
            ),
          ),
          // body: ListView(
          //   children: _buildListItem(context),
          // ),
          body: BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) {
              switch (state.status) {
                case Status.success:
                  return Column(
                    children: _buildListItem(context),
                  );
                default:
                  return Column(
                    children: _buildListItem(context),
                  );
              }
            },
          ),
        ));
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.defaultMarginHorizontal,
                vertical: AppStyles.defaultMarginVertical),
            child: Text(
              "Hi, ${CurrUserData().user!.name}! Let's explore something new!",
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
                colors: AppColors.gradientPrimary,
              ),
              onPressed: () => _navigateToCreateNewsScreen(context),
            ),
          ),
          SizedBox(
            height: AppStyles.smallMarginVertical,
          )
        ],
      ),
    );
  }

  List<Widget> _buildListItem(BuildContext context) {
    List<Widget> listItem = [];

    if (newsListTest.isEmpty) {
      listItem.add(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image_empty_state.png',
                height: 180.h,
              ),
              SizedBox(height: 8.h),
              Text(
                'There are no posts here.',
                style: TextConfigs.semibold16DarkGrey,
              ),
            ],
          ),
        ),
      );
    } else {
      for (BaseNewsDto model in newsListTest) {
        listItem.add(NewsCard(
          news: model,
          screenType: NewsScreenType.feed,
        ));
      }
    }

    listItem.insert(0, _buildHeader(context));
    return listItem;
  }

  void _navigateToCreateNewsScreen(BuildContext context) {
    Navigator.pushNamed(context, CreateNewsScreen.id,
        arguments: [null, null, context.read<FeedBloc>()]);
  }
}
