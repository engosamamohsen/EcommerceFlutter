import 'package:auth/component/app_bar/app_bar_search.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/divider/divider.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/rating.dart';
import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/product/product_cubit.dart';
import 'package:auth/cubit/product/product_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/product/details/product_details.dart';
import 'package:auth/models/product/details/product_details_again.dart';
import 'package:auth/models/response/base_response.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ProductDetailsAgainResponse? productDetailsResponse;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().productDetails(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductSuccessState<ProductDetailsAgainResponse>) {
          print("call api here");
          setState(() {
            print("call api there");
            productDetailsResponse = state.data;
          });
        }
        if (state is ProductSuccessState<BaseResponse>) {
          ToastMessageHelper.showToastMessage(state.data.message);
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
                      addToCart: () {
                        BlocProvider.of<ProductCubit>(context).addToCart(
                            productDetailsResponse!.data!.id,
                            productDetailsResponse!.data!.cartCount);
                      },
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
                                SliderView(
                                    slider:
                                        productDetailsResponse!.data?.gallery ??
                                            []),
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
                                      color: GlobalColors.mainColor,
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

  CartRow(
      {required String price,
      required Function() addToCart,
      required ProductStates state}) {
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
                    showProgress: state is ProductLoadingState ? true : false,
                    text: S.of(context).add_to_cart,
                    radius: 20,
                    padding: 30,
                    onTap: () => addToCart,
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
