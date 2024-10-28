import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/component/network/loader_view.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/slider/slider_view.dart';
import 'package:Emend/component/text.form.global.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/home/home_state.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/home/home_response.dart';
import 'package:Emend/models/product/add_wishlist_response.dart';
import 'package:Emend/utils/device/device_utils.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/home/home_categories.dart';
import 'package:Emend/views/home/home_category_product.dart';
import 'package:Emend/views/home/home_category_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/t_size.dart';
import '../../widget/web/TMeta.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  // Function() seeAllCategories;
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
    TMeta.keywords();
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
                    homeModel?.flashSale.map((product) {
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
              child: state is HomeLoadingState
                  ? const LoadingView()
                  : homeModel != null
                      ? BlocBuilder<ProductCubit, ProductStates>(
                          builder: (context, productState) {
                          return Padding(
                            padding: const EdgeInsets.all(TSize.paddingPage),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // HeaderHomeView(),
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
                                    if (DeviceUtils.isMobileScreen(context))
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            overlayColor: TColor.primary,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<
                                                        BottomNavigationCubit>(
                                                    context)
                                                .updateTabIndex(
                                                    CategoriesView());
                                          },
                                          child: TextGlobal(
                                            fontWeight: FontWeight.bold,
                                            text: S.of(context).see_all,
                                            fontSize: 14,
                                            color: TColor.primary,
                                          )),
                                  ],
                                ),
                                HomeCategories(
                                    categories: homeModel!.categories),
                                SizedBox(height: 20),
                                HomeCategoryProductsList(
                                    categories: homeModel!.categories,
                                    productStates: productStates,
                                    productIdFav: productIdFav,
                                    submitFavourite: (productId) {
                                      productIdFav = productId;
                                      BlocProvider.of<ProductCubit>(context)
                                          .addToFavourite(productId);
                                    }),
                                HomeCategoryProduct(
                                  title: S.of(context).flash_sale,
                                  products: homeModel!.flashSale,
                                  productStates: productStates,
                                  productIdFav: productIdFav,
                                  submitFavourite: (productId) {
                                    productIdFav = productId;

                                    BlocProvider.of<ProductCubit>(context)
                                        .addToFavourite(productId);
                                  },
                                ),
                                //categories products

                                // SizedBox(height: 10),
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
