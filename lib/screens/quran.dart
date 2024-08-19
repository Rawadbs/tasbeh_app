import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/bloc/quran_bloc.dart';
import 'package:third_day_camp/bloc/quran_event.dart';
import 'package:third_day_camp/bloc/quran_state.dart';

import '../api/api.dart';

class QuranPage extends StatelessWidget {
  final String surahName;

  QuranPage({required this.surahName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranBloc(AyaService())..add(FetchAyat(surahName)),
      child: Scaffold(
        backgroundColor: const Color(0xffF3EEFF),
        appBar: AppBar(
          backgroundColor: const Color(0xffF3EEFF),
          centerTitle: true,
          title: Text(
            'سورة $surahName',
            style: TextStyle(
              fontSize: 44,
              color: Color(0XFF3C2560),
              fontFamily: 'TheYear',
            ),
          ),
        ),
        body: BlocBuilder<QuranBloc, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuranError) {
              return Center(child: Text(state.message));
            } else if (state is QuranLoaded) {
              final ayat = state.ayat;
              return ListView.builder(
                itemCount: ayat.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          ayat[index].ayaTextEmlaey,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF3C2560),
                            fontFamily: 'QuranUthmani',
                          ),
                        ),
                      ),
                    ),
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
