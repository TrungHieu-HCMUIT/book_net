import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/configs/validate_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/text_field/password_text_field.dart';
import 'package:book_net/views/base_widgets/text_field/text_field.dart';
import 'package:book_net/views/login_screen/login_screen.dart';
import 'package:book_net/views/login_screen/widgets/button/facebook_button.dart';
import 'package:book_net/views/login_screen/widgets/button/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String id = 'ForgotPasswordScreen';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // var loginBloc;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //  loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    onPressedLogin() {
      Navigator.pushNamed(context, LoginScreen.id);

      // log('button click');
      // log('${_key.currentState!.validate()}');
      // print(passwordValidator
      //     .validators[passwordValidator.validators.length - 1].errorText);
    }

    // onPressedLogin() {
    // }

    return GestureDetector(
      onTap: () => setUnfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      CustomTextField(
                        text: 'Current password',
                        controller: userController,
                        validator: ValidateConfigs.emailValidator,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      PasswordTextField(
                        text: 'Password',
                        controller: passController,
                        validator: ValidateConfigs.passwordValidator,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: Text('Forgot your password?',
                        style: TextConfigs.regular12Blue),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                RaisedGradientButton(
                  child: Text(
                    'LOGIN',
                    style: TextConfigs.medium16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  gradient: const LinearGradient(
                    colors: AppColors.gradientPrimary,
                  ),
                  onPressed: onPressedLogin,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Image.asset('assets/images/or.png'),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    const Flexible(child: FacebookButton(), flex: 1),
                    SizedBox(
                      width: 40.h,
                    ),
                    const Flexible(child: GoogleButton(), flex: 1),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
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
