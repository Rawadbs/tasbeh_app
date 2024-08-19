import 'package:third_day_camp/models/quran_model.dart';

abstract class SurahState {}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<Surah> surahs;

  SurahLoaded(this.surahs);
}

class SurahError extends SurahState {
  final String message;

  SurahError(this.message);
}
