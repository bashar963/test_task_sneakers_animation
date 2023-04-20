part of 'nav_bar_cubit.dart';

abstract class NavBarState extends Equatable {
  final int index;
  const NavBarState(this.index);
}

class NavBarHome extends NavBarState {
  const NavBarHome() : super(0);

  @override
  List<Object> get props => [index];
}

class NavBarFavorite extends NavBarState {
  const NavBarFavorite() : super(1);

  @override
  List<Object> get props => [index];
}

class NavBarStores extends NavBarState {
  const NavBarStores() : super(2);

  @override
  List<Object> get props => [index];
}

class NavBarCart extends NavBarState {
  const NavBarCart() : super(3);

  @override
  List<Object> get props => [index];
}

class NavBarProfile extends NavBarState {
  const NavBarProfile() : super(4);

  @override
  List<Object> get props => [index];
}
