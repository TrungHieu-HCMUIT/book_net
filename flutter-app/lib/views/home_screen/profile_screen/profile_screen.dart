import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/profile_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/dto/user/user_dto.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/icon_button.dart';
import 'package:book_net/views/base_widgets/button/icon_with_text_button.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/chips/list_chip.dart';
import 'package:book_net/views/base_widgets/image/default_circle_avatar.dart';
import 'package:book_net/views/base_widgets/modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:book_net/views/base_widgets/number_with_text/number_with_text.dart';
import 'package:book_net/views/change_password_screen/change_password_screen.dart';
import 'package:book_net/views/home_screen/bookshelf_screen/bookshelf_screen.dart';
import 'package:book_net/views/home_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:book_net/views/home_screen/feed_screen/news.dart';
import 'package:book_net/views/home_screen/follow_screen/follow_screen.dart';
import 'package:book_net/views/home_screen/profile_screen/widgets/stf_btn_follow/stf_btn_follow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatelessWidget {
  static const id = "ProfileScreen";
  const ProfileScreen({Key? key, required UserDto user})
      : _user = user,
        super(key: key);
  final UserDto _user;
  void launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'myOwnEmailAddress@gmail.com',
        queryParameters: {
          'subject': 'Default Subject',
          'body': 'Default body'
        });
    String url = params.toString();
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    onPressEditButton(BuildContext context) {
      Navigator.of(context).popAndPushNamed(EditProfileScreen.id);
    }

    onPressPasswordButton(BuildContext context) {
      Navigator.of(context).popAndPushNamed(ChangePasswordScreen.id);
    }

    onPressedViewBookshelf() {
      Navigator.of(context).pushNamed(BookShelfScreen.id, arguments: _user);
    }

    onTapFollow(BuildContext context) {
      print('object');
      Navigator.of(context).popAndPushNamed(FollowScreen.id,
          arguments: [_user, Profile.following]);
    }

    void onPressMenuButton() {
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
          height: 300.h,
          child: CustomModalBottomSheet(
            widgets: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 12.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Account',
                    style: TextConfigs.bold16,
                  ),
                ),
              ),
              IconWithTextButton(
                  onTap: () => onPressEditButton(context),
                  text: 'Profile',
                  // icon: 'assets/icons/edit.png',
                  iconFlutter: Icons.edit_note_rounded),
              IconWithTextButton(
                onTap: () => onPressPasswordButton(context),
                text: 'Password',
                // icon: 'assets/icons/edit.png',
                iconFlutter: Icons.lock_outline_rounded,
              ),
              // IconWithTextButton(
              //     onTap: () => log('Setting'),
              //     text: 'Setting',
              //     icon: 'assets/icons/edit.png'),
              const Divider(),
            ],
          ),
        ),
      );
    }

    List<String> interested = [
      '🤡 Comedy',
      '👻 Horror',
      '💅🏻 Drama',
      '❤ Romantic'
    ];
    List<Widget> iconButton = [
      CustomIconButton(
          icon: Image.asset('assets/icons/plus-square.png'),
          color: AppColors.whiteColor,
          onPressed: () => {}),
      CustomIconButton(
          icon: Image.asset('assets/icons/menu.png'),
          color: AppColors.whiteColor,
          onPressed: onPressMenuButton)
    ];

    Widget _buildHeader() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultCircleAvatar(
                          width: 64.w, height: 64.h, imageUrl: _user.imageUrl),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            64.w -
                            48.w -
                            20.w,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            const Flexible(
                              child: NumberWithText(
                                number: 33,
                                text: 'like',
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: NumberWithText(
                                number: 33,
                                text: 'following',
                                type: Profile.following,
                                user: _user,
                              ),
                              flex: 1,
                            ),
                            Flexible(
                              child: NumberWithText(
                                number: 33,
                                text: 'follower',
                                type: Profile.follower,
                                user: _user,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  _user.alias,
                  style: TextConfigs.bold16,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: TextButton(
              child: Text(_user.alias + '@gmail.com',
                  style: TextConfigs.regular12OceanGreen),
              onPressed: launchEmailSubmission,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.h, 4.h, 24.h, 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bo cua su that',
                  style: TextConfigs.regular12Gray,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16.h, 4.h, 16.h, 16.h),
            child: ListChip(list: interested),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: Bars(
          title: 'Profile',
          leading: const SizedBox(),
          list: iconButton,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 16.h),
                child: Column(
                  children: [
                    RaisedGradientButton(
                      child: Text(
                        'View ' + _user.alias + "'s bookshelf",
                        style: TextConfigs.medium16
                            .copyWith(color: AppColors.oceanGreenColor),
                      ),
                      gradient: const LinearGradient(
                        colors: AppColors.gradientSecondary,
                      ),
                      onPressed: onPressedViewBookshelf,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 8.h,
                    ),
                    _user != CurrUserData().user
                        ? StatefulButtonFollow(user: _user)
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: newsListTest.length,
                itemBuilder: (context, index) => NewsCard(
                    news: newsListTest[index], screenType: NewsScreenType.feed),
              ),
            ]),
      ),
    );
  }
}
