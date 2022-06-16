import 'dart:developer';

import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/style_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/bar/bar.dart';
import 'package:book_net/views/base_widgets/button/multi_select_button.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';

class SetupScreen extends StatefulWidget {
  static const String id = 'SetupScreen';

  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  List<String> typeOfBookList = [
    '🤡 Comedy',
    '👻 Horror',
    '💅🏻 Drama',
    '❤ Romantic',
    '❤ Fantasy',
    '❤ Anime',
    '🤡 Cosmedy',
    '👻 Hosrror',
    '💅🏻 Dramas',
    '❤ Romasntic',
    '❤ Fanstasy',
    '❤ Ansime',
  ];
  List<String> goalList = [
    'Explore more books',
    'Create reading habit',
    'Connect with people',
  ];
  int activeStep = 0; // Initial step set to 0.
  int dotCount = 3;
  List<String> selectedTypeList = [];
  List<String> selectedGoalList = [];
  List<Widget> list = [];
  // @override
  Widget setUpType() {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Book Type', style: TextConfigs.bold32),
            SizedBox(
              height: 12.h,
            ),
            Text('So we can recommend books for you',
                style: TextConfigs.regular16
                    .copyWith(color: AppColors.grey1Color)),
            SizedBox(
              height: 40.h,
            ),
            MultiSelectButton(
              selectedChoices: selectedTypeList,
              list: typeOfBookList,
              onSelectionChanged: (selectedList) {
                log(selectedList.toString());
                setState(() {
                  selectedTypeList = selectedList;
                });
              },
            ),
          ]),
    );
  }

  Widget setUpGoal() {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tell us your goal', style: TextConfigs.bold32),
            SizedBox(
              height: 48.h,
            ),
            Text('We will show content that suit you',
                style: TextConfigs.regular16
                    .copyWith(color: AppColors.grey1Color)),
            SizedBox(
              height: 32.h,
            ),
            MultiSelectButton(
              list: goalList,
              selectedChoices: selectedGoalList,
              outline: true,
              onSelectionChanged: (selectedList) {
                log(selectedList.toString());
                setState(() {
                  selectedGoalList = selectedList;
                });
              },
            ),
            SizedBox(
              height: 60.h,
            )
          ]),
    );
  }

  Widget createSuccess() {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Congrat!', style: TextConfigs.bold32),
            SizedBox(
              height: 12.h,
            ),
            Text("Your account is ready, let's explore BookNet",
                style: TextConfigs.regular16
                    .copyWith(color: AppColors.grey1Color)),
            SizedBox(
              height: 40.h,
            ),
          ]),
    );
  }

  Widget setUpScreen(int value) {
    switch (value) {
      case 0:
        return setUpType();
      case 1:
        return setUpGoal();
      case 2:
        return createSuccess();
      default:
        return setUpType();
    }
  }

  // OPTIONAL: can be set directly.

  @override
  Widget build(BuildContext context) {
    log(activeStep.toString());
    onTap() {
      activeStep < 2
          ? setState(() {
              activeStep = activeStep + 1;
            })
          : Navigator.popAndPushNamed(context, HomeScreen.id);
    }

    return Scaffold(
      // backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppStyles.appBarHeight),
        child: Bars(
          dotStepper: DotStepper(
            // direction: Axis.vertical,
            dotCount: dotCount,
            dotRadius: 6,

            /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
            activeStep: activeStep,
            shape: Shape.circle,
            spacing: 10,
            indicator: Indicator.blink,

            /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
            onDotTapped: (tappedDotIndex) {
              setState(() {
                activeStep = tappedDotIndex;
              });
            },

            // DOT-STEPPER DECORATIONS
            fixedDotDecoration: const FixedDotDecoration(
              color: AppColors.teaGreenColor,
            ),

            indicatorDecoration: const IndicatorDecoration(
              // style: PaintingStyle.stroke,
              // strokeWidth: 8,
              color: AppColors.oceanGreenColor,
            ),
            lineConnectorDecoration: const LineConnectorDecoration(
              color: AppColors.teaGreenColor,
              strokeWidth: 0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: RaisedGradientButton(
          child: Text(
            activeStep != 2 ? 'Select' : 'Start',
            style: TextConfigs.medium16.copyWith(color: AppColors.whiteColor),
          ),
          gradient: const LinearGradient(
            colors: AppColors.gradientPrimary,
          ),
          onPressed: onTap,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - AppStyles.appBarHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/set-up-screen.png'),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  setUpScreen(activeStep)
                  // activeStep == 0 ? setUpType() : setUpGoal(),
                ]),
          ),
        ),
      ),
    );
  }
}
