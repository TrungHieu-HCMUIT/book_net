import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/utils/utils.dart';
import 'package:book_net/view_models/authentication_bloc/login_bloc/login_bloc.dart';
import 'package:book_net/view_models/authentication_bloc/login_bloc/login_event.dart';
import 'package:book_net/view_models/authentication_bloc/login_bloc/login_state.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/text_field/password_text_field.dart';
import 'package:book_net/views/base_widgets/text_field/text_field.dart';
import 'package:book_net/views/home_screen/home_screen.dart';
import 'package:book_net/views/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_models/status.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInBloc, LogInState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.inProgress:
            Utils.showLoading(context);
            break;
          case Status.success:
            Utils.dismissDialog(context);
            _navigateToHomeScreen(context);
            break;
          default:
            break;
        }
      },
      child: GestureDetector(
        onTap: () => _setUnfocus(context),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, AppStyles.appBarHeight),
            child: const Bars(
              title: 'Login',
            ),
          ),
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 0.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        AppStyles.appBarHeight -
                        60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Welcome back.', style: TextConfigs.bold32),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('Log in to your account.',
                        style: TextConfigs.medium16),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          CustomTextField(
                            text: 'E-mail address',
                            controller: userController,
                            // validator: ValidateConfigs.emailValidator,
                            validator: null,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          PasswordTextField(
                            text: 'Password',
                            controller: passController,
                            // validator: ValidateConfigs.passwordValidator,
                            validator: null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextButton(
                      child: Text('Forgot your password?',
                          style: TextConfigs.regular12OceanGreen),
                      onPressed: () {},
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    Text(
                      'By continuing, you agree to our Terms of Service and Privacy Policy.',
                      style: TextConfigs.regular12OceanGreen,
                    ),
                    SizedBox(
                      height: 20.h,
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
                      onPressed: () => _onPressedLogin(
                          context, _key.currentState!.validate()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _setUnfocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  _onPressedLogin(BuildContext context, bool isValidate) {
    if (isValidate) {
      context.read<LogInBloc>().add(LogInViaUsernameEvent(
          username: userController.text, password: passController.text));
    }

    // log('button click');
    // log('${_key.currentState!.validate()}');
    // print(passwordValidator
    //     .validators[passwordValidator.validators.length - 1].errorText);
  }

  _navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, HomeScreen.id);
  }

  _onPressedSignUp() {
    Navigator.pushNamed(context, SignUpScreen.id);
  }
}
