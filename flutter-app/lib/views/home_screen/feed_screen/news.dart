import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/dto/news/guild_news_dto.dart';
import 'package:book_net/dto/news/post_news_dto.dart';
import 'package:book_net/dto/news/review_news_dto.dart';
import 'package:book_net/utils/time_utils.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/image/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../base_widgets/rating_stars/base_rating_stars.dart';
import '../news_detail_screen/news_detail_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key? key, required BaseNewsDto news, required this.screenType})
      : baseNewsDto = news,
        super(key: key);

  final BaseNewsDto baseNewsDto;
  final NewsScreenType screenType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(baseNewsDto),
              _buildBody(baseNewsDto, context),
              _buildFooter(context, baseNewsDto),
            ],
          ),
        ),
        if (screenType == NewsScreenType.feed)
          SizedBox(
            height: AppStyles.smallMarginVertical,
          )
        else
          const SizedBox(),
      ],
    );
  }

  Widget _buildHeader(BaseNewsDto baseNewsDto) {
    switch (NewsType.fromInt(baseNewsDto.type)) {
      case NewsType.guild:
        return _buildGuildHeader(baseNewsDto);
      default:
        return _buildDefaultHeader(baseNewsDto);
    }
  }

  Widget _buildGuildHeader(BaseNewsDto baseNewsDto) {
    GuildNewsDto guildNewsDto = baseNewsDto as GuildNewsDto;

    return Container(
      height: 40.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: EdgeInsets.all(4.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.h),
                  child: Image.network(
                    guildNewsDto.guildImageUrl,
                    height: 36.h,
                    width: 36.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              DefaultCircleAvatar(
                  width: 24.w,
                  height: 24.h,
                  imageUrl: guildNewsDto.userImageUrl)
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.smallMarginHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  baseNewsDto.userAlias,
                  style: TextConfigs.semibold14,
                ),
                Row(
                  children: [
                    Text(
                      TimeUtils.getDurationText(baseNewsDto.createDate),
                      style: TextConfigs.regular12Grey2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.smallMarginHorizontal),
                      child: Image.asset('assets/icons/ic_dot.png'),
                    ),
                    Text(guildNewsDto.guildName,
                        style: TextConfigs.regular12Grey2)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDefaultHeader(BaseNewsDto baseNewsDto) {
    return Container(
      height: 40.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: Row(
        children: [
          DefaultCircleAvatar(
              width: 40.w, height: 40.h, imageUrl: baseNewsDto.userImageUrl),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.smallMarginHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  baseNewsDto.userAlias,
                  style: TextConfigs.semibold14,
                ),
                Text(
                  TimeUtils.getDurationText(baseNewsDto.createDate),
                  style: TextConfigs.regular12Grey2,
                )
              ],
            ),
          ),
          const Spacer(),
          SvgPicture.asset('assets/icons/ic_horizontal_eclipse.svg'),
        ],
      ),
    );
  }

  Widget _buildBody(BaseNewsDto baseNewsDto, BuildContext context) {
    switch (NewsType.fromInt(baseNewsDto.type)) {
      case NewsType.review:
        return _buildReviewBody(baseNewsDto);
      default:
        return _buildDefaultBody(baseNewsDto);
    }
  }

  Widget _buildReviewBody(BaseNewsDto baseNewsDto) {
    ReviewNewsDto reviewNewsDto = baseNewsDto as ReviewNewsDto;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppStyles.defaultMarginHorizontal,
              vertical: AppStyles.smallMarginVertical),
          child: Text(
            reviewNewsDto.caption,
            textAlign: TextAlign.start,
            style: TextConfigs.regular14,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              reviewNewsDto.bookImageUrl,
              height: AppStyles.newsBodyHeight,
              width: 128.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: AppStyles.smallMarginHorizontal,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppStyles.smallMarginVertical),
                  child: Text(
                    reviewNewsDto.bookName,
                    overflow: TextOverflow.ellipsis,
                    style: TextConfigs.bold16,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: AppStyles.defaultMarginVertical),
                  child: Text(
                    'by ${reviewNewsDto.bookAuthor}',
                    style: TextConfigs.boldItalic12Grey2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppStyles.smallMarginVertical),
                  child: SizedBox(
                    width: 200.w,
                    child: Flexible(
                      child: Text(
                        reviewNewsDto.bookDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextConfigs.regular12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: AppStyles.defaultMarginVertical),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BaseRatingStar(value: reviewNewsDto.bookAvgRating),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppStyles.smallMarginHorizontal),
                          child: Image.asset('assets/icons/ic_dot.png'),
                        ),
                        Text(
                          '${reviewNewsDto.bookNumberOfRating} ratings',
                          style: TextConfigs.regularItalic12DarkGrey,
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDefaultBody(BaseNewsDto baseNewsDto) {
    var newsDto;

    if (NewsType.fromInt(baseNewsDto.type) == NewsType.post) {
      newsDto = baseNewsDto as PostNewsDto;
    } else {
      newsDto = baseNewsDto as GuildNewsDto;
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppStyles.defaultMarginHorizontal,
            vertical: AppStyles.smallMarginVertical),
        child: Text(
          newsDto.caption,
          textAlign: TextAlign.start,
          style: TextConfigs.regular14,
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: AppStyles.newsBodyHeight,
        child: CustomImage(imageUrl: newsDto.imageUrl),
      ),
    ]);
  }

  Widget _buildFooter(BuildContext context, BaseNewsDto baseNewsDto) {
    return SizedBox(
      height: 44.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SizedBox(
                width: 28.w,
                child: Image.asset(
                  'assets/icons/ic_heart.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "${baseNewsDto.totalLike}",
                style: TextConfigs.regular14OceanGreen,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              if (screenType == NewsScreenType.feed) {
                _navigateToNewsDetailScreen(context, baseNewsDto);
              }
            },
            child: Row(
              children: [
                SizedBox(
                  width: 28.w,
                  child: Image.asset(
                    'assets/icons/ic_comment.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "${baseNewsDto.totalComment}",
                  style: TextConfigs.regular14OceanGreen,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToNewsDetailScreen(BuildContext context, BaseNewsDto newsDto) {
    Navigator.pushNamed(
      context,
      NewsDetailScreen.id,
      arguments: newsDto,
    );
  }
}

enum NewsScreenType {
  feed,
  newsDetail;
}
