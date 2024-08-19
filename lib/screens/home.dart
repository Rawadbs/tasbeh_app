import 'package:flutter/material.dart';
import 'package:third_day_camp/screens/after_prayer_athkar.dart';
import 'package:third_day_camp/screens/evening_athkar.dart';
import 'package:third_day_camp/screens/morning_athkar.dart';
import 'package:third_day_camp/screens/sleep_athkar.dart';
import 'package:third_day_camp/screens/surah_quran.dart';
import 'package:third_day_camp/screens/tasbeh.dart';
import 'package:third_day_camp/widgets/big_container_widget.dart';
import 'package:third_day_camp/widgets/small_container_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust childAspectRatio based on screen width
    double childAspectRatio = screenWidth > 600
        ? 1.2
        : 0.99; // Larger screens get smaller aspect ratio

    List<String> texts = [
      'اذكار الصباح',
      'اذكار المساء',
      'اذكار النوم',
      'اذكار بعد الصلاة',
      'القران الكريم',
    ];
    List<Color> colors = [
      const Color(0xFFB299E6),
      const Color(0xffC6B4EF),
      const Color(0xffD6C8F6),
      const Color(0xffE2D8FB),
      const Color(0xffEBE4FE),
    ];

    // Define navigation for each index
    List<Widget> pages = [
      const MorningAthkar(),
      const EveningAthkar(),
      const SleepAthkarPage(),
      const AfterPrayerAthkar(),
      SurahPage(),
    ];

    // Define image paths
    List<String> imagePaths = [
      'assets/sun.png',
      'assets/evening.png',
      'assets/moon.png',
      'assets/pray.png',
      'assets/quran.png',
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
          SliverToBoxAdapter(
            child: ContainerAthkar(
              athkar: 'السبحة',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaasbehScreen(),
                  ),
                );
              },
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(screenWidth * 0.055),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SmallContainer(
                    text: texts[index],
                    color1: colors[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
                        ),
                      );
                    },
                    imageAssetPath: imagePaths[index],
                  );
                },
                childCount: texts.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
                childAspectRatio:
                    childAspectRatio, // Adjusted based on screen width
              ),
            ),
          ),
        ],
      ),
    );
  }
}
