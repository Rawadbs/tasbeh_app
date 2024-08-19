import 'package:third_day_camp/models/quran_model.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<Aya> ayat;

  QuranLoaded(this.ayat);
}

class QuranError extends QuranState {
  final String message;

  QuranError(this.message);
}
