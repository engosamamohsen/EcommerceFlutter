import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/dialog/dialog_utils.dart';
import 'package:Emend/component/emptyView/empty_view.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/app/app_color.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/add_wishlist_response.dart';
import 'package:Emend/models/product/product_model.dart';
import 'package:Emend/models/product/product_list_response.dart';
import 'package:Emend/views/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatefulWidget {
  ProductListView({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<ProductModel>? wishlist;
  int positionFav = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().getProducts(widget.categoryId);
    });
  }

  Future<void> _refreshData() async {
    // Trigger a refresh of the data
    context.read<ProductCubit>().getProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductSuccessState<ProductListResponse>) {
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
              // print("isFav ${wishlist![positionFav].isLike}");
              // wishlist![positionFav].isLike =
              //     state.data.data?.isFavorite == 1 ? true : false;
              wishlist![positionFav].isLike = !wishlist![positionFav].isLike;
            });
          }
        }
      },
      builder: (context, state) {
        print("state is here $state");
        return Scaffold(
            backgroundColor: Colors.white,
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
                                child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount: wishlist!.length,
                                    itemBuilder: (context, item) {
                                      return ProductItemView(
                                        product: wishlist![item],
                                        showProgres: state
                                                is ProductLoadingWishlistState &&
                                            positionFav == item,
                                        submitFavourite: (int productId) {
                                          positionFav = item;
                                          BlocProvider.of<ProductCubit>(context)
                                              .addToFavourite(productId);
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
