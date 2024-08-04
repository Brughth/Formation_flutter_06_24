import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/app_init_screen.dart';
import 'package:formation_flutter_join24/counter/logic/bloc/counter1_bloc.dart';
import 'package:formation_flutter_join24/service_locator.dart';

void main() {
  setupLocator();
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
    return BlocProvider(
      create: (context) => getIt.get<Counter1Bloc>(),
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
