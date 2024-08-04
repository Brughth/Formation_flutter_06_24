import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/counter/logic/cubit/counter2_cubit.dart';
import 'package:gap/gap.dart';

class Counter2Screen extends StatelessWidget {
  Counter2Screen({super.key});
  final Counter2Cubit counterCubit = Counter2Cubit();
  final Counter2Cubit counterCubit2 = Counter2Cubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter With Cubit"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  BlocConsumer<Counter2Cubit, Counter2State>(
                    bloc: counterCubit,
                    listener: (context, state) {
                      if (state.counter == counterCubit2.state.counter) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Brovo !!"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        "${state.counter}",
                        style: Theme.of(context).textTheme.displayLarge,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  BlocConsumer<Counter2Cubit, Counter2State>(
                    bloc: counterCubit2,
                    listener: (context, state) {
                      if (state.counter == counterCubit.state.counter) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Brovo !!"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        "${state.counter}",
                        style: Theme.of(context).textTheme.displayLarge,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        heroTag: "increment1",
                        onPressed: () {
                          counterCubit2.increment();
                        },
                        label: const Text("Increment"),
                        icon: const Icon(Icons.add),
                      ),
                      const Gap(20),
                      FloatingActionButton.extended(
                        heroTag: "decrement1",
                        onPressed: () {
                          counterCubit2.decrement();
                        },
                        label: const Text("Decrement"),
                        icon: const Icon(Icons.remove),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
