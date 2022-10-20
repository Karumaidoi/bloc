import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemng/presentation/router/app_router.dart';

import 'Logic/cubit/cubit_cubit.dart';

void main() {
  final CounterState counterState1 =
      CounterState(counterValue: 1, wasIncremented: true);
  final CounterState counterState2 =
      CounterState(counterValue: 1, wasIncremented: true);
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
