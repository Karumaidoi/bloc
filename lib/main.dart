import 'package:flutter/material.dart';
import 'package:statemng/cubit/cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Flutter bLOC',
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
