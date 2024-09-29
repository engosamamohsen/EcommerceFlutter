import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/cubit/product/product_cubit.dart';
import 'package:auth/cubit/product/product_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/models/product/add_wishlist_response.dart';
import 'package:auth/models/product/product_list_response.dart';
import 'package:auth/views/home/home_categories.dart';
import 'package:auth/views/home/home_category_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key, required this.seeAllCategories});

  Function() seeAllCategories;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();
  HomeModel? homeModel;
  int productIdFav = -1;
  ProductStates productStates = ProductInitState();
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
    return MultiBlocListener(
        listeners: [
          BlocListener<ProductCubit, ProductStates>(
            listener: (context, state) {
              print("state welcome product $state , $productIdFav");

              setState(() {
                productStates = state;
              });
              // print("state welcome product $state <<<<<<<<<<<<");

//ProductSuccessState<AddWishlistResponse>
              if (state is ProductSuccessState<AddWishlistResponse>) {
                print("state welcome");
                print("state welcome productFav $productIdFav");
                setState(() {
                  if (homeModel != null) {
                    homeModel?.flashSale.products.map((product) {
                      if (product.id == productIdFav) {
                        print("state welcome");
                        product.isLike = !product.isLike;
                      }
                    }).toList();
                    homeModel?.mostSale.map((product) {
                      if (product.id == productIdFav) {
                        print("state welcome");
                        product.isLike = !product.isLike;
                      }
                    }).toList();
                    homeModel?.newestProduct.map((product) {
                      if (product.id == productIdFav) {
                        print("state welcome");
                        product.isLike = !product.isLike;
                      }
                    }).toList();
                  }
                  productIdFav = -1;
                });
              }
            },
          ),
        ],
        child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
          if (state is HomeSuccessState<HomeResponse>) {
            homeModel = state.data.data;
          }
        }, builder: (context, state) {
          return Container(
              padding: const EdgeInsets.all(8),
              child: state is HomeLoadingState
                  ? const LoadingViewFull()
                  : homeModel != null
                      ? BlocBuilder<ProductCubit, ProductStates>(
                          builder: (context, productState) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HomeBar(),
                                const SizedBox(height: 30),
                                SliderView(slider: homeModel!.banners),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextGlobal(
                                      text: S.of(context).categories,
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        overlayColor: GlobalColors.mainColor,
                                      ),
                                      onPressed: () {
                                        print("welcome here");
                                      },
                                      child: TextGlobal(
                                        fontWeight: FontWeight.bold,
                                        text: S.of(context).see_all,
                                        fontSize: 14,
                                        color: GlobalColors.mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                                HomeCategories(
                                    categories: homeModel!.categories),
                                const SizedBox(height: 10),
                                HomeCategoryProduct(
                                  title: S.of(context).flash_sale,
                                  products: homeModel!.flashSale.products,
                                  productStates: productStates,
                                  productIdFav: productIdFav,
                                  submitFavourite: (productId) {
                                    productIdFav = productId;

                                    BlocProvider.of<ProductCubit>(context)
                                        .addToFavourite(productId);
                                  },
                                ),
                                const SizedBox(height: 10),
                                HomeCategoryProduct(
                                    title: S.of(context).newest_products,
                                    products: homeModel!.newestProduct,
                                    productStates: productStates,
                                    productIdFav: productIdFav,
                                    submitFavourite: (productId) {
                                      productIdFav = productId;
                                      BlocProvider.of<ProductCubit>(context)
                                          .addToFavourite(productId);
                                    }),
                                const SizedBox(height: 10),
                                HomeCategoryProduct(
                                    title: S.of(context).most_sale,
                                    products: homeModel!.mostSale,
                                    productStates: productStates,
                                    productIdFav: productIdFav,
                                    submitFavourite: (productId) {
                                      productIdFav = productId;

                                      BlocProvider.of<ProductCubit>(context)
                                          .addToFavourite(productId);
                                    }),
                              ],
                            ),
                          );
                        })
                      : NetworkError());
        }));
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
