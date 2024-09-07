import 'package:auth/component/loading_view.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/views/home/home_categories.dart';
import 'package:auth/views/home/home_category_product.dart';
import 'package:auth/views/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
            body: Container(
                padding: EdgeInsets.all(10),
                child: state is HomeLoadingState
                    ? const LoadingView()
                    : state is HomeSuccessState<HomeResponse>
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                  HomeCategories(
                                      categories: state.data.data.categories),
                                ],
                              );
                              // HomeBar(),
                              // const SizedBox(height: 30),
                              // SliderView(),
                              // const SizedBox(height: 30),

                              // const SizedBox(height: 30),
                              // HomeCategoryProduct(title: "welcome"),
                            },
                          )
                        : NetworkError()),
          ),
        );
      },
    );
  }
}

class HomeBar extends StatelessWidget {
  HomeBar({super.key});
  // final TextEditingController searchController = TextEditingController();
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
        // TextFormGlobal(
        //     hint: S.of(context).search,
        //     textInputType: TextInputType.emailAddress,
        //     obscureText: false,
        //     controller: searchController)
      ],
    );
  }
}
