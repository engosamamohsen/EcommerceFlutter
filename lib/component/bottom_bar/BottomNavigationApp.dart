import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/views/cart/cart_view.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        // seeAllCategories: () {
        //   print("welcome in SeeAllCategories");
        // },
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
    return BlocListener<BottomNavigationCubit, Widget>(
      listener: (context, state) {
        print("welcome in index hererere");

        if (state is HomeView) {
          _onItemTapped(0);
        }
        if (state is CategoriesView) {
          print("welcome in index Done");
          _onItemTapped(1);
        }
      },
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        selectedItemColor: TColor.primary,
        unselectedItemColor: TColor.secondary,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            label: AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
