import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter2_state.dart';

class Counter2Cubit extends Cubit<Counter2State> {
  Counter2Cubit() : super(const Counter2State(counter: 0));

  increment() {
    var newValue = state.counter + 1;
    emit(Counter2State(counter: newValue));
  }

  decrement() {
    var newValue = state.counter - 1;
    emit(Counter2State(counter: newValue));
  }
}
