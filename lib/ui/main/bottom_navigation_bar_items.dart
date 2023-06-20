import 'package:flutter/material.dart';
import 'package:test_assignment_effective/ui/main/widgets/bottom_navigation_icon_widget.dart';
import 'package:test_assignment_effective/ui/restaurant_icons.dart';

const List<BottomNavigationBarItem> bottomNavigationBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: 'Главная',
    icon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.home,
      label: 'Главная',
    ),
    activeIcon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.home,
      label: 'Главная',
    ),
  ),
  BottomNavigationBarItem(
    label: 'Поиск',
    icon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.search,
      label: 'Главная',
    ),
    activeIcon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.search,
      label: 'Главная',
    ),
  ),
  BottomNavigationBarItem(
    label: 'Корзина',
    icon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.bag,
      label: 'Главная',
    ),
    activeIcon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.bag,
      label: 'Главная',
    ),
  ),
  BottomNavigationBarItem(
    label: 'Аккаунт',
    icon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.profile,
      label: 'Главная',
    ),
    activeIcon: BottomNavigationIconWidget(
      iconData: RestaurantIcons.profile,
      label: 'Главная',
    ),
  ),
];
