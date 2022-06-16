import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/login_screen/choose_login_type.dart';
import 'package:book_net/views/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({Key? key}) : super(key: key);
  static const String id = 'carousel';

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    onPressedCreateAccount() {
      Navigator.pushNamed(context, SignUpScreen.id);
    }

    onPressedLogin() {
      Navigator.pushNamed(context, LoginTypeScreen.id);
    }

    final pages = List.generate(
        4,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.amazonColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 4.w),
              child: SizedBox(
                height: 300.h,
                width: 300.w,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: const TextStyle(color: AppColors.whiteColor),
                )),
              ),
            ));
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(height: 48,),
          Padding(
            padding: EdgeInsets.fromLTRB(112.w, 48.h, 112.w, 32.h),
            child: Image.asset('assets/images/LogoHorizontal.png'),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            height: 300.h,
            width: 300.w,
            child: PageView.builder(
              controller: controller,
              // itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 44.h, bottom: 16.h),
            child: Text(
              'Create awesome reviews',
              style: TextConfigs.bold24,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: pages.length,
            effect: WormEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              type: WormType.thin,
              dotColor: AppColors.teaGreenColor,
              activeDotColor: AppColors.oceanGreenColor,
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.fromLTRB(16.h, 0, 16.h, 50.w),
            child: Column(children: [
              RaisedGradientButton(
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextConfigs.medium16
                      .copyWith(color: AppColors.whiteColor),
                ),
                gradient: const LinearGradient(
                  colors: AppColors.gradientPrimary,
                ),
                onPressed: onPressedCreateAccount,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: TextConfigs.regular12Grey2,
                  ),
                  TextButton(
                    onPressed: onPressedLogin,
                    child: Text(
                      'Login',
                      style: TextConfigs.regular12OceanGreen,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
