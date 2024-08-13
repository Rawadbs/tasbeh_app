import 'package:flutter/material.dart';
import 'package:third_day_camp/screens/after_prayer_athkar.dart';
import 'package:third_day_camp/screens/evening_athkar.dart';
import 'package:third_day_camp/screens/morning_athkar.dart';
import 'package:third_day_camp/screens/sleep_athkar.dart';
import 'package:third_day_camp/screens/subha.dart';
import 'package:third_day_camp/widgets/big_container_widget.dart';
import 'package:third_day_camp/widgets/small_container_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      'اذكار الصباح',
      'اذكار المساء',
      'اذكار النوم',
      'اذكار بعد الصلاة'
    ];
    List<Color> colors = [
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
    ];

    // Define image paths
    List<String> imagePaths = [
      'assets/sun.png',
      'assets/evening.png',
      'assets/moon.png',
      'assets/pray.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3EEFF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffF3EEFF),
        title: const Text(
          'ذكرنا',
          style: TextStyle(
            fontSize: 45,
            color: Color(0XFF3C2560),
            fontFamily: 'TheYear',
          ),
        ),
      ),
      body: Column(
        children: [
          ContainerAthkar(
            athkar: 'السبحة',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubhaScreen(),
                ),
              );
            },
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة في الشبكة
                crossAxisSpacing: 20, // تقليل المسافة بين الأعمدة
                mainAxisSpacing: 30, // تقليل المسافة بين الصفوف
                childAspectRatio: 0.99,
              ),
              itemBuilder: (context, index) {
                return SmallContainer(
                  text: texts[index],
                  color1: colors[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            pages[index], // Navigate to the corresponding page
                      ),
                    );
                  },
                  imageAssetPath: imagePaths[index], // تمرير مسار الصورة
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
