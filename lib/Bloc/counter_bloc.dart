import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      if (state is CounterUpdated) {
        final currentCount = (state as CounterUpdated).count;
        final updatedCount =
            (currentCount + 1) % 100; // Increment and wrap around at 100
        emit(CounterUpdated(updatedCount));
      } else {
        emit(CounterUpdated(1)); // Start from 1 if the state is initial
      }
    });

    on<ResetCounter>((event, emit) {
      emit(CounterUpdated(0)); // Reset the counter to 0
    });
  }
}
