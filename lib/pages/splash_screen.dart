import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/widgets/main_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/smear-loader.json'),
      // Column(
      //   children: [
      //     Image.asset('assets/logo-united1.png'),
      //     SizedBox(height: 10),
      //     const Text(
      //       'Man United',
      //       style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      backgroundColor: Colors.black,
      nextScreen: const MainPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: Duration(seconds: 1),
    );
  }
}