import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_bloc.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_event.dart';
import 'package:book_net/view_models/create_news_bloc/create_news_state.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
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
  const CreateNewsScreen({Key? key, this.guild}) : super(key: key);
  final GuildDto? guild;
  @override
  Widget build(BuildContext context) {
    print('new post');
    print(guild?.name);
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
                _buildTextField(),
                ImageAndPostWidget(
                  onPostTap: (images) => {
                    context
                        .read<CreateNewsBloc>()
                        .add(PushNewsEvent(files: images))
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildTextField() {
    return Container(
      height: 180.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppStyles.defaultMarginHorizontal),
      child: TextFormField(
        style: TextConfigs.regular16,
        cursorColor: AppColors.green1Color,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Write something...',
        ),
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
