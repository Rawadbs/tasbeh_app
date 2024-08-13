// counter_state.dart
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterUpdated extends CounterState {
  final int count;

  CounterUpdated(this.count);
}
