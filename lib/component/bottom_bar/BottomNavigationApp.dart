import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/views/cart/cart_view.dart';
import 'package:auth/views/category/categories_view.dart';
import 'package:auth/views/home/home_view.dart';
import 'package:auth/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationApp extends StatefulWidget {
  const BottomNavigationApp({super.key, required this.onTapPage});

  final Function(Widget) onTapPage;

  @override
  State<BottomNavigationApp> createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  int _selectedIndex = 0;

  final list = [
    HomeView(
      seeAllCategories: () {
        print("welcome in SeeAllCategories");
      },
    ),
    CategoriesView(),
    CartView(),
    ProfileView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onTapPage(list[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: true,
      selectedItemColor: GlobalColors.mainColor,
      unselectedItemColor: GlobalColors.secondaryColor,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: S.of(context).home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: S.of(context).categories,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_outlined),
          label: S.of(context).cart,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: S.of(context).profile,
        ),
      ],
    );
  }
}
