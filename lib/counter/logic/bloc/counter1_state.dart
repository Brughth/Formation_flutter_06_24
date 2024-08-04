part of 'counter1_bloc.dart';

@immutable
class Counter1State {
  final int counter;

  const Counter1State({
    required this.counter,
  });

  Counter1State copyWith({
    int? counter,
  }) {
    return Counter1State(
      counter: counter ?? this.counter,
    );
  }
}
