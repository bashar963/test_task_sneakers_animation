import 'package:flutter/material.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navigationKey;

  String? get currentRoute;

  BuildContext? get currentContext;

  Future<dynamic> navigateTo(String routeName, [dynamic args]);

  Future<dynamic> navigateReplaceTo(String routeName, [dynamic args]);

  Future<dynamic> navigateAndRemoveStack(String routeName, [dynamic args]);

  void goBack([dynamic args]);

  void goBackToRoot();

  void goBackUntil(String untilRouteName);

  void goBackUntilAndReplace(String? untilRouteName, String replaceByRouteName);
}
