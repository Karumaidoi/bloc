import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/cubit/cubit_cubit.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Third screen',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text('Counter pushed:😀')),
          const SizedBox(
            height: 15,
          ),
          BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
            return Text(
              state.counterValue.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            );
          }, listener: ((context, state) {
            if (state.wasIncremented == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Addition verified 😂')));
            } else if (state.wasIncremented == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Minus verified 🥵')));
            }
          })),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 45,
              ),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: const Icon(Icons.minimize_outlined),
              )
            ],
          )
        ],
      ),
    );
  }
}
