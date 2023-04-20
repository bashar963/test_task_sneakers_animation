import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/data/service/local/navigation/navigation.dart';

@Singleton(as: NavigationService)
class NavigationServiceImpl extends NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  String? _currentRoute;

  @override
  BuildContext? get currentContext => _navigationKey.currentContext;

  @override
  String? get currentRoute => _currentRoute;

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  Future<dynamic> navigateTo(String routeName, [dynamic args]) async {
    _currentRoute = routeName;
    final argsFromPrevious = await _navigationKey.currentState
        ?.pushNamed(routeName, arguments: args);
    return argsFromPrevious;
  }

  @override
  Future<void> navigateReplaceTo(String routeName, [dynamic args]) async {
    _currentRoute = routeName;
    await _navigationKey.currentState
        ?.pushReplacementNamed(routeName, arguments: args);
  }

  @override
  Future<void> navigateAndRemoveStack(String routeName, [dynamic args]) async {
    _currentRoute = routeName;
    await _navigationKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  @override
  void goBack([dynamic args]) {
    return _navigationKey.currentState?.pop(args);
  }

  @override
  void goBackToRoot() {
    _currentRoute = '/';
    _navigationKey.currentState?.popUntil(ModalRoute.withName('/'));
  }

  @override
  void goBackUntil(String untilRouteName) {
    _currentRoute = untilRouteName;
    _navigationKey.currentState
        ?.popUntil(ModalRoute.withName(_currentRoute ?? '/'));
  }

  @override
  void goBackUntilAndReplace(
    String? untilRouteName,
    String replaceByRouteName,
  ) {
    _currentRoute = replaceByRouteName;
    _navigationKey.currentState?.pushNamedAndRemoveUntil(
      _currentRoute!,
      ModalRoute.withName(untilRouteName ?? '/'),
    );
  }
}
