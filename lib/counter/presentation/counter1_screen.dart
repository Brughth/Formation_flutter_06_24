import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/counter/logic/bloc/counter1_bloc.dart';
import 'package:gap/gap.dart';

class Counter1Screen extends StatelessWidget {
  const Counter1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter With Bloc"),
      ),
      body: Center(
        // child: BlocListener<Counter1Bloc, Counter1State>(
        //   listener: (context, state) {
        //     if (state.counter == 20) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text("Bravo !! ${state.counter}"),
        //         ),
        //       );
        //     }
        //   },
        //   child: BlocBuilder<Counter1Bloc, Counter1State>(
        //     builder: (context, state) {
        //       return Text(
        //         "${state.counter}",
        //         style: Theme.of(context).textTheme.displayLarge,
        //       );
        //     },
        //   ),
        // ),
        child: BlocConsumer<Counter1Bloc, Counter1State>(
          listener: (context, state) {
            if (state.counter == 20) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Bravo !! ${state.counter}"),
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
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: "increment",
            onPressed: () {
              context.read<Counter1Bloc>().add(IncrementCounterEvent());
            },
            label: const Text("Increment"),
            icon: const Icon(Icons.add),
          ),
          const Gap(20),
          FloatingActionButton.extended(
            heroTag: "decrement",
            onPressed: () {
              context.read<Counter1Bloc>().add(DecrementCounterEvent());
            },
            label: const Text("Decrement"),
            icon: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
