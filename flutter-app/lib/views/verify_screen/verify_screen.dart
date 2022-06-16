import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/base_widgets/text_field/circle_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);
  static const String id = 'VerifyScreen';

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController text1Controller = TextEditingController();
  TextEditingController text2Controller = TextEditingController();
  TextEditingController text3Controller = TextEditingController();
  TextEditingController text4Controller = TextEditingController();
  TextEditingController text5Controller = TextEditingController();
  TextEditingController text6Controller = TextEditingController();

  late FocusNode text1, text2, text3, text4;

  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();

    super.dispose();
  }

  bool number1Validate = false;
  bool number2Validate = false;
  bool number3Validate = false;
  bool number4Validate = false;
  @override
  Widget build(BuildContext context) {
    print(text1Controller.text);

    onPressedSignUp() {
      _key.currentState!.validate();
    }

    return GestureDetector(
      onTap: () => setUnfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, AppStyles.appBarHeight),
          child: const Bars(),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppStyles.appBarHeight -
                48.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Enter authentication code.',
                      style: TextConfigs.bold24),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text('Enter the 4-digit that we have sent to your email',
                    style: TextConfigs.medium16),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleTextField(
                      controller: text1Controller,
                      focusNode: text1,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).requestFocus(text2);
                        }
                        setState(() {
                          if (value == '') {
                            number1Validate = false;
                            return;
                          }
                          number1Validate = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    CircleTextField(
                      controller: text2Controller,
                      focusNode: text2,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).requestFocus(text3);
                        }
                        setState(() {
                          if (value == '') {
                            number2Validate = false;
                            return;
                          }
                          number2Validate = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    CircleTextField(
                      focusNode: text3,
                      controller: text3Controller,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).requestFocus(text4);
                        }
                        setState(() {
                          if (value == '') {
                            number3Validate = false;
                            return;
                          }
                          number3Validate = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    CircleTextField(
                      controller: text4Controller,
                      focusNode: text4,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            if (value == '') {
                              number4Validate = false;
                              return;
                            }
                            number4Validate = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedGradientButton(
                        child: Text(
                          'Continue',
                          style: TextConfigs.medium16
                              .copyWith(color: AppColors.whiteColor),
                        ),
                        disable: (!number1Validate ||
                            !number2Validate ||
                            !number3Validate ||
                            !number4Validate),
                        gradient: const LinearGradient(
                          colors: AppColors.gradientPrimary,
                        ),
                        onPressed: () => _onPressedContinue(
                            context,
                            text1Controller.text,
                            text2Controller.text,
                            text3Controller.text,
                            text4Controller.text),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RaisedGradientButton(
                        child: Text(
                          'Resend code',
                          style: TextConfigs.medium16
                              .copyWith(color: AppColors.oceanGreenColor),
                        ),
                        gradient: const LinearGradient(
                          colors: AppColors.gradientSecondary,
                        ),
                        onPressed: () => _onPressedResend(context),
                      ),
                    ],
                  ),
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

  _onPressedContinue(BuildContext context, String text1, String text2,
      String text3, String text4) {
    print('button continue: ' + text1 + text2 + text3 + text4);
  }

  _onPressedResend(BuildContext context) {
    // log('${_key.currentState!.validate()}');
    // print(passwordValidator
    //     .validators[passwordValidator.validators.length - 1].errorText);
  }
}
