import 'package:flutter/material.dart';

import 'package:test_task/view/screens/screens.dart';

abstract class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      case ProductDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            args: args as ProductDetailsArgs,
          ),
          settings: settings,
        );
      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(

          ),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
