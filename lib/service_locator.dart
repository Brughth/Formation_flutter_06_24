import 'package:get_it/get_it.dart';

import 'counter/logic/bloc/counter1_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Counter1Bloc>(Counter1Bloc()
    ..add(IncrementCounterEvent())
    ..add(IncrementCounterEvent()));
}
