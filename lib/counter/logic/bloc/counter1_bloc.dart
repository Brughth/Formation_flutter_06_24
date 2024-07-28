import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter1_event.dart';
part 'counter1_state.dart';

class Counter1Bloc extends Bloc<Counter1Event, Counter1State> {
  Counter1Bloc() : super(const Counter1State(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      var newValue = state.counter + 1;
      emit(Counter1State(counter: newValue));
    });
    on<DecrementCounterEvent>((event, emit) {
      var newValue = state.counter - 1;
      emit(Counter1State(counter: newValue));
    });
  }
}
