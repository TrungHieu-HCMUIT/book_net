import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/login_screen/login_screen.dart';
import 'package:book_net/views/login_screen/widgets/button/facebook_button.dart';
import 'package:book_net/views/login_screen/widgets/button/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTypeScreen extends StatefulWidget {
  const LoginTypeScreen({Key? key}) : super(key: key);
  static const String id = 'chooseLoginType';

  @override
  _LoginTypeScreenState createState() => _LoginTypeScreenState();
}

class _LoginTypeScreenState extends State<LoginTypeScreen> {
  // var loginBloc;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    onPressedLogin() {
      Navigator.pushNamed(context, LoginScreen.id);
    }

    return GestureDetector(
      onTap: () => setUnfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars(),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Padding(padding: )
                Text('Welcome back.', style: TextConfigs.bold32),
                Text('Choose login method.', style: TextConfigs.medium16),
                SizedBox(
                  height: 24.h,
                ),
                RaisedGradientButton(
                  child: Text(
                    'Login with email',
                    style: TextConfigs.medium16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  gradient: const LinearGradient(
                    colors: AppColors.gradientPrimary,
                  ),
                  onPressed: onPressedLogin,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const GoogleButton(text: 'Continue with Google'),
                SizedBox(
                  height: 16.h,
                ),
                const FacebookButton(
                  text: 'Continue with Facebook',
                ),
              ]),
        ),
      ),
    );
  }

  setUnfocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
