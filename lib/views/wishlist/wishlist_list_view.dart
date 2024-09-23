import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/dialog/dialog_utils.dart';
import 'package:auth/component/emptyView/empty_view.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/product/product_cubit.dart';
import 'package:auth/cubit/product/product_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/product/add_wishlist_response.dart';
import 'package:auth/models/product/product_model.dart';
import 'package:auth/models/product/wishlist_response.dart';
import 'package:auth/views/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  List<ProductModel>? wishlist;
  int positionFav = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().getWishList();
    });
  }

  Future<void> _refreshData() async {
    // Trigger a refresh of the data
    context.read<ProductCubit>().getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductSuccessState<WishListResponse>) {
          //list
          setState(() {
            wishlist = state.data.data!.data;
          });
        }
        if (state is ProductSuccessState<AddWishlistResponse>) {
          //delete
          if (wishlist != null &&
              positionFav != -1 &&
              positionFav < wishlist!.length) {
            setState(() {
              wishlist![positionFav].isLike = !wishlist![positionFav].isLike;
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: GlobalColors.backGroundColor,
            appBar: GlobalAppBar(
              title: S.of(context).wishlist,
            ),
            body: state is ProductLoadingState
                ? const LoadingViewFull()
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: wishlist != null
                        ? wishlist!.isEmpty
                            ? EmptyView(
                                textMsg: S.of(context).your_favorite_is_empty,
                              )
                            : Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: wishlist!.length,
                                    itemBuilder: (context, item) {
                                      return ProductItemView(
                                        product: wishlist![item],
                                        showProgres: state
                                            is ProductLoadingWishlistState,
                                        submitFavourite: () {
                                          positionFav = item;
                                          BlocProvider.of<ProductCubit>(context)
                                              .addToFavourite(
                                                  wishlist![item].id);
                                        },
                                      );
                                    }))
                        : state is ProductFailedState
                            ? NetworkError()
                            : Center(
                                child: TextGlobal(
                                  maxLines: 2,
                                  text:
                                      "${S.of(context).loading_please_wait} $state",
                                ),
                              )));
      },
    );
  }
}
