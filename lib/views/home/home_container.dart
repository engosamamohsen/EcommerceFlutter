import 'package:Emend/component/bottom_bar/BottomNavigationApp.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/home/home_state.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/widget/header_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_seo/meta_seo.dart';

import '../../component/bottom_bar/bottom_navigation_cubit.dart';
import '../../utils/device/device_utils.dart';
import '../../widget/drawer_view.dart';
import '../../widget/web/TMeta.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  @override
  State<HomeContainer> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeContainer> {
  final TextEditingController searchController = TextEditingController();
  Widget? _current_page;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add GlobalKey

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
    TMeta.keywords();

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            bottomNavigationBar: (DeviceUtils.isMobileScreen(context)
                ? BottomNavigationApp(onTapPage: (page) {
                    setState(() {
                      _current_page = page;
                    });
                  })
                : null),
            drawer: AppDrawer(selectPage: _current_page, widgetPageSelect: (page) {
              BlocProvider.of<BottomNavigationCubit>(context)
                  .updateTabIndex(page);
            },),
            body: Column(
              children: [
                HeaderHomeView(
                  clickMenu: () {
                    _scaffoldKey.currentState?.openDrawer();
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