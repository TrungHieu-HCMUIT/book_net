import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/news/comment_dto.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/home_screen/news_detail_screen/reply_comment_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/text_configs.dart';
import '../../../dto/news/reply_comment_dto.dart';
import '../../../utils/time_utils.dart';

class CommentRowItem extends StatelessWidget {
  const CommentRowItem({Key? key, required this.commentdto}) : super(key: key);

  final CommentDto commentdto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: AppStyles.defaultMarginHorizontal,
              right: AppStyles.defaultMarginHorizontal,
              bottom: AppStyles.smallMarginVertical),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultCircleAvatar(
                  width: 40.w,
                  height: 40.h,
                  imageUrl: commentdto.commentUser.imageUrl),
              SizedBox(width: AppStyles.smallMarginHorizontal),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    commentdto.commentUser.alias,
                    style: TextConfigs.semibold14,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Text(
                      commentdto.content,
                      style: TextConfigs.regular12Grey2,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        TimeUtils.getDurationText(commentdto.createDate),
                        style: TextConfigs.regular12Grey2,
                      ),
                      SizedBox(width: AppStyles.defaultMarginHorizontal),
                      Text(
                        'Reply',
                        style: TextConfigs.regular12Amazon,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: _buildReplyComments(commentdto.replyList),
        )
      ],
    );
  }

  List<Widget> _buildReplyComments(List<ReplyCommentDto> replyComments) {
    List<Widget> widgets = [];
    for (var replyComment in replyComments) {
      widgets.add(ReplyCommentRowItem(replyCommentDto: replyComment));
    }
    return widgets;
  }
}
