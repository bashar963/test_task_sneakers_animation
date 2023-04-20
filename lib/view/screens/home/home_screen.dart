import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/view/screens/home/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:test_task/view/screens/home/pages/discover/discover_page.dart';
import 'package:test_task/view/screens/home/widgets/home_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }

  Widget content() {
    return BlocConsumer<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return IndexedStack(
          index: state.index,
          children: [
            const DiscoverPage(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
