import 'package:Emend/component/bottom_bar/BottomNavigationApp.dart';
import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/home/home_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/widget/header_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/device/device_utils.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeContainer> {
  final TextEditingController searchController = TextEditingController();
  Widget? _current_page;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current_page = HomeView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeCubit>(context).home();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: (DeviceUtils.isMobileScreen(context)
                ? BottomNavigationApp(onTapPage: (page) {
                    setState(() {
                      _current_page = page;
                    });
                  })
                : null),
            drawer: AppDrawer(),
            body: Column(
              children: [
                HeaderHomeView(
                  clickMenu: () {

                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: _current_page!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Removes default padding
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Close the drawer and navigate to Home
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Close the drawer and navigate to Settings
              Navigator.pop(context);
              // You can implement navigation here
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Close the drawer and navigate to About
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
