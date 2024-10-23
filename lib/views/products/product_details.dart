import 'package:Emend/component/app_bar/app_bar_search.dart';
import 'package:Emend/component/button.global.dart';
import 'package:Emend/component/divider/divider.dart';
import 'package:Emend/component/favourite/favourite.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/rating.dart';
import 'package:Emend/component/slider/slider_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/product/product_cubit.dart';
import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/product/add_wishlist_response.dart';
import 'package:Emend/models/product/details/product_details_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../widget/web/TMeta.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key, required this.productId});

  int productId = 0;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ProductDetailsResponse? productDetailsResponse;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().productDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    TMeta.keywords();

    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductSuccessState<ProductDetailsResponse>) {
          print("call api here");
          setState(() {
            productDetailsResponse = state.data;
          });
        }
        if (state is ProductSuccessState<AddWishlistResponse>) {
          print("call api here");
          setState(() {
            if (productDetailsResponse != null) {
              productDetailsResponse?.data?.isLike =
                  (state.data.data?.isFavorite == 0 ? false : true);
            }
          });
        }
        if (state is ProductSuccessState<BaseResponse>) {
          ToastMessageHelper.showToastMessage(state.data.message);
          setState(() {
            String count = productDetailsResponse?.data?.cartCount ?? "";
            if (count.isEmpty) {
              productDetailsResponse?.data?.cartCount = "1";
            } else {
              productDetailsResponse?.data?.cartCount =
                  ((int.tryParse(count)! + 1)).toString();
            }
          });
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: GlobalAppBarSearch(
                onChanged: (query) {
                  // Handle search query here
                  print('Search query: $query');
                },
              ),
              backgroundColor: Colors.white,
              bottomNavigationBar: productDetailsResponse != null
                  ? CartRow(
                      price: productDetailsResponse!.data!.price.toString(),
                      state: state,
                    )
                  : null,
              body: state is ProductLoadingState
                  ? const LoadingViewFull()
                  : productDetailsResponse != null
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SliderView(
                                        slider: productDetailsResponse!
                                                .data?.gallery ??
                                            []),
                                    Positioned(
                                        top: 10,
                                        right: 20,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: FavoriteCell(
                                            size: 30,
                                            isFavourite: productDetailsResponse
                                                    ?.data!.isLike ??
                                                false,
                                            showProgress: state
                                                is ProductLoadingWishlistState,
                                            submit: () {
                                              BlocProvider.of<ProductCubit>(
                                                      context)
                                                  .addToFavourite(
                                                      productDetailsResponse!
                                                          .data!.id);
                                            },
                                          ),
                                        )),
                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),
                                TextGlobal(
                                  text: productDetailsResponse!.data?.name ??
                                      "" * 100,
                                  fontSize: 18,
                                  maxLines: 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ButtonGlobal(
                                      text: productDetailsResponse!
                                                  .data!.category !=
                                              null
                                          ? productDetailsResponse!
                                              .data!.category!.name
                                          : "",
                                      onTap: () {
                                        //call category api (osama)
                                      },
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    StarRating(
                                      rating:
                                          productDetailsResponse!.data?.rate ??
                                              0,
                                      starCount: 5,
                                      size: 30,
                                      color: TColor.primary,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    TextGlobal(
                                      text:
                                          "(${productDetailsResponse!.data?.rate.toString()})",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextGlobal(
                                    text: S.of(context).description,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                SizedBox(
                                  height: 8,
                                ),
                                productDetails(
                                    productDetailsResponse!.data?.description ??
                                        ""),
                                SizedBox(
                                  height: 30,
                                ),
                                DividerGlobal(),
                                SizedBox(
                                  height: 30,
                                ),
                                TextGlobal(
                                  text: S.of(context).tech_info,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                // techInfo(productDetailsResponse!
                                //             .data?.technicalInformation !=
                                //         null
                                //     ? productDetailsResponse!
                                //         .data?.technicalInformation
                                //     : []),

                                techInfo(productDetailsResponse
                                        ?.data?.technicalInformation ??
                                    []),
                              ],
                            ),
                          ),
                        )
                      : state is ProductFailedState
                          ? NetworkError()
                          : Center(
                              child: TextGlobal(
                                  text: S.of(context).loading_please_wait),
                            )),
        );
      },
    );
  }

  CartRow({required String price, required ProductStates state}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Wrap(
                children: [
                  ButtonGlobal(
                    showProgress:
                        state is ProductLoadingAddToCartState ? true : false,
                    text: S.of(context).add_to_cart,
                    radius: 20,
                    padding: 30,
                    onTap: () => {
                      BlocProvider.of<ProductCubit>(context).addToCart(
                          productDetailsResponse!.data!.id,
                          productDetailsResponse!.data!.cartCount)
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Wrap(children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextGlobal(
                    text: S.of(context).total_price,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextGlobal(
                    text: "$price ${S.of(context).currency}",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  productDetails(String description) {
    return SingleChildScrollView(
        child: Html(
      data: description,
    ));
  }

  techInfo(List<TechnicalInformation> techInfoList) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemBuilder: (context, index) {
          var tech = techInfoList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextGlobal(
                      text: tech.key,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    TextGlobal(
                      text: tech.value,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
        itemCount: techInfoList.length,
        separatorBuilder: (context, index) {
          return DividerGlobal(thickness: 0.5);
        },
      ),
    );
  }
}
