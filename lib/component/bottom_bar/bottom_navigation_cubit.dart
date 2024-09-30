import 'package:auth/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<Widget> {
  BottomNavigationCubit()
      : super(HomeView()); // Initial state is the first tab (Home)

  // Function to change the selected tab
  void updateTabIndex(Widget index) {
    emit(index);
  }
}
