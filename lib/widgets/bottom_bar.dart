import 'package:flutter/material.dart';
import 'package:third_day_camp/screens/home.dart';
import 'package:third_day_camp/screens/surah_quran.dart';
import 'package:third_day_camp/screens/tasbeh.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    SurahPage(),
    TaasbehScreen(),
    HomePageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF3EEFF),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/quran.png',
              width: 24,
              height: 24,
            ),
            label: 'القرآن',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/subha.png',
              width: 24,
              height: 24,
            ),
            label: 'السبحة',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/TasbehLogo.png',
              width: 24,
              height: 24,
            ),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0XFF3C2560),
        unselectedLabelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'TheYear',
          color: Color(0XFF3C2560),
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'TheYear',
          color: Color(0XFF3C2560),
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
