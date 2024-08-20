import 'package:flutter/material.dart';
import 'package:third_day_camp/screens/after_prayer_athkar.dart';
import 'package:third_day_camp/screens/evening_athkar.dart';
import 'package:third_day_camp/screens/morning_athkar.dart';
import 'package:third_day_camp/screens/sleep_athkar.dart';
import 'package:third_day_camp/widgets/big_container_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> texts = [
      'اذكار الصباح',
      'اذكار المساء',
      'اذكار النوم',
      'اذكار بعد الصلاة',
    ];
    List<Color> colors = [
      const Color(0xFFB299E6),
      const Color(0xffC6B4EF),
      const Color(0xffD6C8F6),
      const Color(0xffE2D8FB),
    ];

    List<String> imagePaths = [
      'assets/sun.png',
      'assets/evening.png',
      'assets/moon.png',
      'assets/pray.png',
    ];

    // Define navigation for each index
    List<Widget> pages = [
      const MorningAthkar(),
      const EveningAthkar(),
      const SleepAthkarPage(),
      const AfterPrayerAthkar(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3EEFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3EEFF),
        title: Text(
          'ذكرنا',
          style: TextStyle(
            fontSize: 45,
            color: Color(0XFF3C2560),
            fontFamily: 'TheYear',
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(screenWidth * 0.055),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ContainerAthkar(
                    athkar: texts[index],
                    color1: colors[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
                        ),
                      );
                    },
                    imageAssetPath: imagePaths[index], // مسار الصورة
                  );
                },
                childCount: texts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
