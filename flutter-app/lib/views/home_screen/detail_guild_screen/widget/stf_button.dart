import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/views/base_widgets/button/icon_with_text_button.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/dialog/confirm_dialog.dart';
import 'package:book_net/views/base_widgets/modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:book_net/views/home_screen/create_news_screen/create_news_screen.dart';
import 'package:book_net/views/home_screen/feed_screen/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StateFulButton extends StatefulWidget {
  const StateFulButton({
    super.key,
    this.guild,
  });
  final GuildDto? guild;
  @override
  State<StateFulButton> createState() => _StateFulButtonState();
}

class _StateFulButtonState extends State<StateFulButton> {
  bool isJoined = true;

  @override
  Widget build(BuildContext context) {
    // String type = 'Finished';
    setStateJoin() {
      setState(() {
        isJoined = !isJoined;
      });
    }

    onPressLeaveButton(BuildContext context) {
      Navigator.of(context).pop();

      showMyDialog(context, 'Leave group', '',
          'Are you sure want to leave this group?', 'Leave', setStateJoin);
    }

    void onPressJoinedButton() {
      // print('clock');
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        builder: (context) => SizedBox(
          height: 200.h,
          child: CustomModalBottomSheet(
            widgets: [
              IconWithTextButton(
                onTap: () => onPressLeaveButton(context),
                text: 'Leave group',
                iconFlutter: Icons.u_turn_left_rounded,
              ),
              const Divider(),
            ],
          ),
        ),
      );
    }

    return isJoined
        ? Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24.h),
                child: Column(
                  children: [
                    RaisedGradientButton(
                        child: Text(
                          'Joined',
                          style: TextConfigs.medium16
                              .copyWith(color: AppColors.oceanGreenColor),
                        ),
                        outline: true,
                        gradient: const LinearGradient(
                          colors: <Color>[
                            AppColors.whiteColor,
                            AppColors.whiteColor,
                          ],
                        ),
                        onPressed: () {
                          onPressJoinedButton();
                        }),
                    SizedBox(
                      height: AppStyles.defaultMarginVertical,
                    ),
                    const Divider(),
                    SizedBox(
                      height: AppStyles.defaultMarginVertical,
                    ),
                    RaisedGradientButton(
                      child: Text(
                        'Create a post',
                        style: TextConfigs.medium16
                            .copyWith(color: AppColors.whiteColor),
                      ),
                      gradient: const LinearGradient(
                        colors: AppColors.gradientPrimary,
                      ),
                      onPressed: () => _navigateToCreateNewsScreen(context),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsGuildTest.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    news: newsGuildTest[index],
                    screenType: NewsScreenType.feed,
                  );
                },
              ),
            ],
          )
        : Padding(
            padding: EdgeInsets.all(24.h),
            child: RaisedGradientButton(
                child: Text(
                  'Join',
                  style: TextConfigs.medium16
                      .copyWith(color: AppColors.whiteColor),
                ),
                gradient: const LinearGradient(
                  colors: AppColors.gradientPrimary,
                ),
                onPressed: () {
                  setState(() {
                    isJoined = !isJoined;
                  });
                }),
          );
  }

  void _navigateToCreateNewsScreen(BuildContext context) {
    Navigator.pushNamed(context, CreateNewsScreen.id,
        arguments: [widget.guild, null]);
  }
}
