import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/routes/app_routes.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:book_net/views/home_screen/home_screen.dart';
import 'package:book_net/views/launch_screen.dart/launch_screen.dart';
import 'package:book_net/views/verify_screen/verify_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BookNetApp());
}

class BookNetApp extends StatelessWidget {
  const BookNetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use for UI testing
    CurrUserData().setUser(userTestModel);

    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().onGenerateRoute,
        initialRoute: SplashScreen.id,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: child,
      ),
      // child: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  static const String id = 'splash';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/LOGO.png'),
      nextScreen: const LaunchScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
