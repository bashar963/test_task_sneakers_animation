import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/utils/app_theme.dart';
import 'package:test_task/view/screens/home/cubits/nav_bar/nav_bar_cubit.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarCubit = BlocProvider.of<NavBarCubit>(
      context,
      listen: true,
    );

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navBarCubit.state.index,
      onTap: navBarCubit.setTabByIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: AppTheme.colorSecondarySwatch.shade500,
      backgroundColor: AppTheme.colorSecondarySwatch.shade200,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.maps_home_work_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: 'Home',
        ),
      ],
    );
  }
}
