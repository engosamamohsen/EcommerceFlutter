import 'package:auth/core/app_color.dart';
import 'package:auth/views/cart/cart_view.dart';
import 'package:auth/views/department/departments_view.dart';
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

  final list = [HomeView(), DepartmentsView(), CartView(), ProfileView()];

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
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view),
          label: 'Departements',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
