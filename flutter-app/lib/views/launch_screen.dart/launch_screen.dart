import 'package:book_net/configs/color_configs.dart';
import 'package:book_net/configs/text_configs.dart';
import 'package:book_net/views/base_widgets/button/raised_gradient_button.dart';
import 'package:book_net/views/carousel_screen/carousel_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  static const String id = 'launch';

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
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
    onPressedChooseLoginType() {
      Navigator.pushNamed(context, CarouselScreen.id);
    }

    return GestureDetector(
      onTap: () => setUnfocus(context),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LaunchScreen.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/LOGO.png',
                  height: 114.h,
                  width: 122.w,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 0),
                child: Text(
                  'Read book whenever you want.',
                  style: TextConfigs.bold24Zomp,
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: RaisedGradientButton(
                  child: Text(
                    'START',
                    style: TextConfigs.medium16
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  gradient: const LinearGradient(
                    colors: AppColors.gradientPrimary,
                  ),
                  onPressed: onPressedChooseLoginType,
                ),
              ),
            ],
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
