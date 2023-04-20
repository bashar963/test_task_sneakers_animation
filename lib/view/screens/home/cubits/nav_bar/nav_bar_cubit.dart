import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_task/data/service/local/navigation/navigation.dart';
import 'package:test_task/di/configure_dependencies.dart';
import 'package:test_task/view/screens/screens.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarHome());

  final _navigationService = getIt.get<NavigationService>();

  void setTabByIndex(int index) {
    switch (index) {
      case 0:
        _setHomeTab();
        break;
      case 1:
        _setFavoriteTab();
        break;
      case 2:
        _setStoresTab();
        break;
      case 3:
        _setCartTab();
        break;
      case 4:
        _setProfileTab();
        break;
      default:
        _setHomeTab();
        break;
    }
  }

  void _setHomeTab() => emit(const NavBarHome());
  void _setFavoriteTab() => emit(const NavBarFavorite());
  void _setStoresTab() => emit(const NavBarStores());
  void _setCartTab() {
    _navigationService.navigateTo(CartScreen.routeName);
  }
  void _setProfileTab() => emit(const NavBarProfile());
}
