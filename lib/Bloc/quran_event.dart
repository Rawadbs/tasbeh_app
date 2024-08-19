abstract class QuranEvent {}

class FetchAyat extends QuranEvent {
  final String surahName;

  FetchAyat(this.surahName);
}
