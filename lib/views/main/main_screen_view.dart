import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/views/main/home_screen_view.dart';
import 'package:auth/views/main/profile_screen_view.dart';
import 'package:auth/views/main/wishlist_screen_view.dart';
import 'package:flutter/material.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  List items = [HomeScreen(), WishlistScreen(), ProfileScreen()];

  int current_index = 0;

  void onTap(index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: items[current_index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          currentIndex: current_index,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: GlobalColors.mainColor,
          unselectedItemColor: GlobalColors.secondaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "favourite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: "profile"),
          ]),
    );
  }
}
