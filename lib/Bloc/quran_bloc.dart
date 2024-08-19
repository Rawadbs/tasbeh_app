import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/api/api.dart';
import 'package:third_day_camp/bloc/quran_event.dart';
import 'package:third_day_camp/bloc/quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final AyaService ayaService;

  QuranBloc(this.ayaService) : super(QuranInitial()) {
    on<FetchAyat>((event, emit) async {
      emit(QuranLoading());
      try {
        final ayat = await ayaService.fetchAyatBySurah(event.surahName);
        emit(QuranLoaded(ayat));
      } catch (e) {
        emit(QuranError('حدث خطأ: $e'));
      }
    });
  }
}
