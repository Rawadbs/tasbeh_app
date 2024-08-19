import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/api/api.dart';
import 'package:third_day_camp/screens/quran.dart';
import 'package:third_day_camp/bloc/surah_bloc.dart'; // تأكد من أن هذا المسار صحيح
import 'package:third_day_camp/bloc/surah_event.dart'; // تأكد من أن هذا المسار صحيح
import 'package:third_day_camp/bloc/surah_state.dart'; // تأكد من أن هذا المسار صحيح

class SurahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahBloc(SurahService())..add(FetchSurahs()),
      child: Scaffold(
        backgroundColor: const Color(0xffF3EEFF),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xffF3EEFF),
          title: Text(
            'سور القرآن',
            style: TextStyle(
              fontSize: 44,
              color: Color(0XFF3C2560),
              fontFamily: 'TheYear',
            ),
          ),
        ),
        body: BlocBuilder<SurahBloc, SurahState>(
          builder: (context, state) {
            if (state is SurahLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SurahError) {
              return Center(child: Text('حدث خطأ: ${state.message}'));
            } else if (state is SurahLoaded) {
              final surahs = state.surahs;
              return ListView.builder(
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 116, 72, 187),
                      child: Text(
                        '${surahs[index].suraNumber}', // عرض رقم السورة
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      "سورة ${surahs[index].suraNameAr}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF3C2560),
                        fontFamily: 'TheYear',
                      ),
                      textAlign: TextAlign.right,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuranPage(surahName: surahs[index].suraNameAr),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('لا توجد بيانات'));
            }
          },
        ),
      ),
    );
  }
}
