import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/app_init_screen.dart';
import 'package:formation_flutter_join24/counter/logic/bloc/counter1_bloc.dart';
import 'package:formation_flutter_join24/service_locator.dart';
import 'package:formation_flutter_join24/shared/cubit/application_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return CupertinoApp(
    //     title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: CupertinoThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<Counter1Bloc>(),
        ),
        BlocProvider<ApplicationCubit>(
          create: (context) => getIt.get<ApplicationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppInitScreen(),
      ),
    );
  }
}
