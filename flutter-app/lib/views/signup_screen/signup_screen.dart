import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/configs/validate_configs.dart';
import 'package:book_net/utils/utils.dart';
import 'package:book_net/view_models/authentication_bloc/signup_bloc/signup_bloc.dart';
import 'package:book_net/view_models/authentication_bloc/signup_bloc/signup_event.dart';
import 'package:book_net/view_models/authentication_bloc/signup_bloc/signup_state.dart';
import 'package:book_net/view_models/status.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/icon_button.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/text_field/password_text_field.dart';
import 'package:book_net/views/base_widgets/text_field/text_field.dart';
import 'package:book_net/views/verify_screen/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = 'signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    onPressedSignUp() {
      _key.currentState!.validate();
      if (_key.currentState!.validate()) {
        context.read<SignUpBloc>().add(OnSignUpEvent(
            email: emailController.text,
            username: usernameController.text,
            password: passController.text));
      }
    }

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        switch (state.status) {
          case Status.inProgress:
            Utils.showLoading(context);
            break;
          case Status.success:
            Utils.dismissDialog(context);
            Navigator.pushNamed(context, VerifyScreen.id);
            break;
          default:
            break;
        }
      },
      child: GestureDetector(
        onTap: () => setUnfocus(context),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, AppStyles.appBarHeight),
            child: const Bars(
              title: 'Sign up',
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Welcome.', style: TextConfigs.bold32),
                  Text('Create a new account.', style: TextConfigs.medium16),
                  SizedBox(
                    height: 24.h,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        CustomTextField(
                          text: 'E-mail address',
                          controller: emailController,
                          validator: ValidateConfigs.emailValidator,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextField(
                          text: 'Username',
                          controller: usernameController,
                          validator: ValidateConfigs.usernameValidator,
                        ),
                        // SizedBox(
                        //   height: 24.h,
                        // ),
                        // CustomTextField(
                        //   text: 'Last name',
                        //   controller: lastNameController,
                        //   validator: ValidateConfigs.lastNameValidator,
                        // ),
                        SizedBox(
                          height: 24.h,
                        ),
                        PasswordTextField(
                          text: 'Password',
                          controller: passController,
                          validator: ValidateConfigs.passwordValidator,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        PasswordTextField(
                          text: 'Confirm password',
                          controller: confirmPassController,
                          validator: (val) => MatchValidator(
                                  errorText: 'Passwords do not match')
                              .validateMatch(passController.text,
                                  confirmPassController.text),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  RaisedGradientButton(
                    child: Text(
                      'SIGN UP',
                      style: TextConfigs.medium16
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    gradient: const LinearGradient(
                      colors: AppColors.gradientPrimary,
                    ),
                    onPressed: onPressedSignUp,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset('assets/images/or.png'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomIconButton(
                          icon: Image.asset('assets/icons/facebook.png'),
                          color: AppColors.blueColor,
                          onPressed: () => {}),
                      SizedBox(
                        width: 16.w,
                      ),
                      CustomIconButton(
                          icon: Image.asset('assets/icons/google.png'),
                          color: AppColors.whiteColor,
                          onPressed: () => {}),
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
