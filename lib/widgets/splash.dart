import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:third_day_camp/widgets/bottom_bar.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xffF3EEFF),
      splash: LottieBuilder.asset(
        'assets/AaC20o6upa.json',
        frameRate:
            const FrameRate(20), // يمكنك تعديل هذه القيمة لضبط سرعة الحركة
        repeat: true, // يتكرر التحريك بلا نهاية
      ),
      nextScreen: BottomBar(),
      splashIconSize: 800, // حجم الأيقونة المتحركة
      duration: 3500,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
