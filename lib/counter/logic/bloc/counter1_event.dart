part of 'counter1_bloc.dart';

@immutable
sealed class Counter1Event {}

final class IncrementCounterEvent extends Counter1Event {}

final class DecrementCounterEvent extends Counter1Event {}
