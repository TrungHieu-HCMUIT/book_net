import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/color_configs.dart';
import '../feed_screen/news.dart';
import 'comment_row_item.dart';
import 'comment_text_field.dart';

class NewsDetailScreen extends StatelessWidget {
  static const String id = 'NewsDetailScreen';

  const NewsDetailScreen({Key? key, required this.newsModel}) : super(key: key);

  final BaseNewsDto newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars()),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          children: _buildNewsDetail(newsModel),
        ),
        _buildPostCommentField()
      ]),
    );
  }

  List<Widget> _buildNewsDetail(BaseNewsDto newsDto) {
    List<Widget> result = [];

    // Build news section
    result.add(NewsCard(
      news: newsDto,
      screenType: NewsScreenType.newsDetail,
    ));

    result.addAll(_buildCommentList(newsDto));

    // Add space
    result.add(SizedBox(
      height: 48.h,
    ));

    return result;
  }

  List<Widget> _buildCommentList(BaseNewsDto newsModel) {
    List<CommentRowItem> commentList = [];
    for (var comment in newsModel.commentList) {
      commentList.add(CommentRowItem(commentdto: comment));
    }

    return commentList;
  }

  Widget _buildPostCommentField() {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.all(AppStyles.defaultMarginHorizontal),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: DefaultCircleAvatar(
                width: 40.w, height: 40.h, imageUrl: newsModel.userImageUrl),
          ),
          SizedBox(
            width: AppStyles.smallMarginHorizontal,
          ),
          const Flexible(child: CommentTextField()),
        ],
      ),
    );
  }
}
