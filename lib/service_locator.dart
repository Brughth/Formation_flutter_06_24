import 'package:formation_flutter_join24/shared/cubit/application_cubit.dart';
import 'package:get_it/get_it.dart';

import 'counter/logic/bloc/counter1_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Counter1Bloc>(Counter1Bloc()
    ..add(IncrementCounterEvent())
    ..add(IncrementCounterEvent()));

  getIt.registerSingleton(ApplicationCubit());
}
