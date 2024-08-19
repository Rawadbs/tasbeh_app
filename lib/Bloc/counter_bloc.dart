import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    // Load the counter value when the bloc is created
    _loadCounter();

    on<IncrementCounter>((event, emit) async {
      // Ensure that we are dealing with CounterUpdated state
      if (state is CounterUpdated) {
        var count = (state as CounterUpdated).count + 1;

        await _saveCounter(count);
        emit(CounterUpdated(count));
      }
    });

    on<ResetCounter>((event, emit) async {
      await _saveCounter(0);
      emit(CounterUpdated(0));
    });
  }

  Future<void> _saveCounter(int count) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', count);
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final count = prefs.getInt('counter') ?? 0;
    emit(CounterUpdated(count));
  }
}
