import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/dto/book/book_dto.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_bloc.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_event.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_state.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/rating_stars/base_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/style_configs.dart';
import '../../../configs/text_configs.dart';
import '../../../utils/utils.dart';
import '../../../view_models/status.dart';
import '../../base_widgets/bar/bar.dart';
import 'news_image_widget.dart';

class CreateNewsScreen extends StatelessWidget {
  static const id = 'CreateNewsScreen';
  CreateNewsScreen({Key? key, this.guild, this.book}) : super(key: key);
  final GuildDto? guild;
  final BookDto? book;
  final _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNewsBloc, CreateNewsState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.inProgress:
            Utils.showLoading(context);
            break;
          case Status.success:
            Utils.dismissDialog(context);
            Navigator.pop(context);
            break;
          default:
            break;
        }
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, AppStyles.appBarHeight),
            child: const Bars(
              title: 'New post',
            ),
          ),
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                guild != null
                    ? _buildGuildHeader(context)
                    : _buildHeader(context),
                SizedBox(
                  height: AppStyles.defaultMarginVertical,
                ),
                book != null ? _buildBookTextField() : _buildTextField(),
                ImageAndPostWidget(
                  onPostTap: (images) => {
                    context.read<CreateNewsBloc>().add(PushNewsEvent(
                        files: images, caption: _captionController.text))
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTextField() {
    return SizedBox(
      height: book == null ? 180.h : 310.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.defaultMarginHorizontal),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 120.h,
                width: double.infinity - 32.w,
                child: TextFormField(
                  controller: _captionController,
                  style: TextConfigs.regular16,
                  cursorColor: AppColors.green1Color,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write something...',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookTextField() {
    return SizedBox(
      height: book == null ? 180.h : 310.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.defaultMarginHorizontal),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 120.h,
                width: double.infinity - 32.w,
                child: TextFormField(
                  style: TextConfigs.regular16,
                  cursorColor: AppColors.green1Color,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write something...',
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    book!.imageUrl,
                    height: AppStyles.newsBodyHeight,
                    width: 128.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: AppStyles.smallMarginHorizontal,
                  ),
                  SizedBox(
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppStyles.smallMarginVertical),
                          child: SizedBox(
                            child: Text(
                              book!.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextConfigs.bold16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppStyles.defaultMarginVertical),
                          child: Text(
                            'by ${book!.author}',
                            overflow: TextOverflow.ellipsis,
                            style: TextConfigs.boldItalic12Grey2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppStyles.smallMarginVertical),
                          child: SizedBox(
                            width: 200.w,
                            child: Flexible(
                              child: Text(
                                book!.descrition,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextConfigs.regular12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppStyles.defaultMarginVertical),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const BaseRatingStar(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppStyles.smallMarginHorizontal),
                                  child: Image.asset('assets/icons/ic_dot.png'),
                                ),
                                Text(
                                  '${book!.numberOfRating} ratings',
                                  style: TextConfigs.regularItalic12DarkGrey,
                                )
                              ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGuildHeader(BuildContext context) {
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
                    guildNewsTestModel.guildImageUrl,
                    height: 36.h,
                    width: 36.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              DefaultCircleAvatar(
                  width: 24.w,
                  height: 24.h,
                  imageUrl: guildNewsTestModel.userImageUrl)
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
                  userTestModel.alias,
                  style: TextConfigs.semibold14,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppStyles.smallMarginHorizontal),
                      child: Image.asset('assets/icons/ic_dot.png'),
                    ),
                    Text(guildNewsTestModel.guildName,
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 40.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: Row(
        children: [
          DefaultCircleAvatar(
              width: 40.w,
              height: 40.h,
              imageUrl: CurrUserData().user!.imageUrl),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyles.smallMarginHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CurrUserData().user!.alias,
                  style: TextConfigs.regular16,
                ),
                Text(
                  CurrUserData().user!.name,
                  style: TextConfigs.regular14Grey2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
