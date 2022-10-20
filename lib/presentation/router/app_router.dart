import 'package:flutter/cupertino.dart';
import 'package:statemng/Logic/cubit/cubit_cubit.dart';
import 'package:statemng/presentation/Screens/counter_screen.dart';
import 'package:statemng/presentation/Screens/home_screen.dart';
import 'package:statemng/presentation/Screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const MyHomePage());
      case '/secondScreen':
        return CupertinoPageRoute(builder: (_) => const CounterScreen());
      case '/thirdscreen':
        return CupertinoPageRoute(builder: (_) => const ThirdScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const MyHomePage());
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
