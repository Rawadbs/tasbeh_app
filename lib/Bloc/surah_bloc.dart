import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_day_camp/api/api.dart';
import 'package:third_day_camp/bloc/surah_event.dart';
import 'package:third_day_camp/bloc/surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final SurahService surahService;

  SurahBloc(this.surahService) : super(SurahInitial()) {
    on<FetchSurahs>((event, emit) async {
      emit(SurahLoading());
      try {
        final surahs = await surahService.fetchSurahs();
        emit(SurahLoaded(surahs));
      } catch (e) {
        emit(SurahError('حدث خطأ: $e'));
      }
    });
  }
}
