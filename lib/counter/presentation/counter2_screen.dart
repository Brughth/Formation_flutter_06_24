import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/counter/logic/cubit/counter2_cubit.dart';
import 'package:gap/gap.dart';

class Counter2Screen extends StatelessWidget {
  Counter2Screen({super.key});
  final Counter2Cubit counterCubit = Counter2Cubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter With Cubit"),
      ),
      body: Center(
        child: BlocBuilder<Counter2Cubit, Counter2State>(
          bloc: counterCubit,
          builder: (context, state) {
            return Text(
              "${state.counter}",
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: "increment",
            onPressed: () {
              counterCubit.increment();
            },
            label: const Text("Increment"),
            icon: const Icon(Icons.add),
          ),
          const Gap(20),
          FloatingActionButton.extended(
            heroTag: "decrement",
            onPressed: () {
              counterCubit.decrement();
            },
            label: const Text("Decrement"),
            icon: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
