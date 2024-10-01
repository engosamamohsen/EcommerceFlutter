import 'package:Emend/component/bottom_bar/BottomNavigationApp.dart';
import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/app/app_color.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/home/home_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeContainer> {
  final TextEditingController searchController = TextEditingController();
  Widget? _current_page;

  void _navigateToPage(Widget page) {
    setState(() {
      _current_page = page;
    });
  }

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
            bottomNavigationBar: BottomNavigationApp(onTapPage: (page) {
              setState(() {
                _current_page = page;
              });
            }),
            body: _current_page,
          ),
        );
      },
    );
  }
}

class HomeBar extends StatefulWidget {
  HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextGlobal(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                text: "${S.of(context).welcome_in} ${S.of(context).app_name}"),
            Icon(
              Icons.circle_notifications,
              size: 40,
              color: GlobalColors.mainColor,
            )
          ],
        ),
        const SizedBox(height: 10),
        TextFormGlobal(
            hint: S.of(context).search,
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            controller: searchController)
      ],
    );
  }
}
