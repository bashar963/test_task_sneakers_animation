import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/service/local/navigation/navigation.dart';
import 'package:test_task/di/configure_dependencies.dart';
import 'package:test_task/utils/app_router.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/utils/status_bar_color.dart';
import 'package:test_task/view/screens/cart/cart_cubit.dart';
import 'package:test_task/view/screens/home/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:test_task/view/screens/home/home_bloc.dart';
import 'package:test_task/view/screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => NavBarCubit(),
        ),
        BlocProvider(
          create: (_) => CartCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setStatusBarColor();
    return MaterialApp(
      navigatorKey: getIt.get<NavigationService>().navigationKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
