import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:third_day_camp/models/athkar.dart';
import 'package:third_day_camp/models/sleepatkar_model.dart';



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
