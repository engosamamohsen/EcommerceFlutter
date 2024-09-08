import 'package:auth/component/bottom_bar/BottomNavigationApp.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/views/home/home_categories.dart';
import 'package:auth/views/home/home_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
            bottomNavigationBar: BottomNavigationApp(),
            body: Container(
                padding: EdgeInsets.all(10),
                child: state is HomeLoadingState
                    ? const LoadingViewFull()
                    : state is HomeSuccessState<HomeResponse>
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  HomeBar(),
                                  const SizedBox(height: 30),
                                  SliderView(slider: state.data.data.banners),
                                  const SizedBox(height: 30),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  const SizedBox(height: 30),
                                  HomeCategoryProduct(
                                      title: S.of(context).flash_sale,
                                      products:
                                          state.data.data.flashSale.products),
                                  const SizedBox(height: 30),
                                  HomeCategoryProduct(
                                      title: S.of(context).newest_products,
                                      products: state.data.data.newestProduct),
                                  const SizedBox(height: 30),
                                  HomeCategoryProduct(
                                      title: S.of(context).most_sale,
                                      products: state.data.data.mostSale),
                                ],
                              );
                            },
                          )
                        : NetworkError()),
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
