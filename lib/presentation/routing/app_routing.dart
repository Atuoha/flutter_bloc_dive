import 'package:diving_into_flutter_bloc/presentation/screens/screen2.dart';
import 'package:diving_into_flutter_bloc/presentation/screens/screen3.dart';
import 'package:flutter/material.dart';
import '../../cubit_counter.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CounterScreen.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CounterScreen(),
        );

      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SecondScreen(),
        );

      case ThirdScreen.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ThirdScreen(),
        );

      default:
        return null;
    }
  }
}
