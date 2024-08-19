import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:third_day_camp/models/athkar.dart';
import 'package:third_day_camp/models/sleepatkar_model.dart';

import '../models/quran_model.dart';



class SleepAthkarService {
  Future<SleepAthkar> fetchSleepAthkar() async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/sleep_athkar.json');

    // تحليل JSON
    final jsonResponse = json.decode(jsonString);

    return SleepAthkar.fromJson(jsonResponse);
  }
}
class MorningZekrService {
  Future<Athkar> fetchMorningZekr() async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/morning_zekr.json');

    // تحليل JSON
    final jsonResponse = json.decode(jsonString);

    return Athkar.fromJson(jsonResponse);
  }
}
class EveningZekrService {
  Future<Athkar> fetchEveningZekr() async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/evening_zekr.json');

    // تحليل JSON
    final jsonResponse = json.decode(jsonString);

    return Athkar.fromJson(jsonResponse);
  }
}
class AfterPrayerZekrService {
  Future<Athkar> fetchAfterPrayerZekr() async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/after_prayer_zekr.json');

    // تحليل JSON
    final jsonResponse = json.decode(jsonString);

    return Athkar.fromJson(jsonResponse);
  }
}

class SurahService {
  Future<List<Surah>> fetchSurahs() async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/quran.json');

    // تحليل JSON
    final List<dynamic> jsonResponse = json.decode(jsonString);

    // استخراج السور الفريدة
    final List<Surah> surahList = jsonResponse
        .map((json) => Surah.fromJson(json))
        .toList()
        .fold<List<Surah>>([], (previousValue, element) {
      if (!previousValue.any((surah) => surah.suraNameAr == element.suraNameAr)) {
        previousValue.add(element);
      }
      return previousValue;
    });

    return surahList;
  }
}
class AyaService {
  Future<List<Aya>> fetchAyatBySurah(String surahName) async {
    // تحميل الملف من الأصول
    final jsonString = await rootBundle.loadString('assets/quran.json');

    // تحليل JSON
    final List<dynamic> jsonResponse = json.decode(jsonString);

    // تصفية الآيات بناءً على اسم السورة
    final List<Aya> ayaList = jsonResponse
        .where((json) => json['sura_name_ar'] == surahName)
        .map((json) => Aya.fromJson(json))
        .toList();

    return ayaList;
  }
}