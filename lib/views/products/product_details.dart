import 'package:auth/component/app_bar/app_bar_search.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/rating.dart';
import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text/text_big_global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/cubit/product/product_cubit.dart';
import 'package:auth/cubit/product/product_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/product/details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().productDetails(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget>.generate(5, (counter) => Text("asd"));

    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {},
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
              bottomNavigationBar:
                  state is ProductSuccessState<ProductDetailsResponse>
                      ? CartRow(state.data.data.price.toString())
                      : null,
              body: state is ProductLoadingState
                  ? const LoadingViewFull()
                  : state is ProductSuccessState<ProductDetailsResponse>
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SliderView(slider: state.data.data.banners),
                                SizedBox(
                                  height: 8,
                                ),
                                TextGlobal(
                                  text: state.data.data.name * 100,
                                  fontSize: 18,
                                  maxLines: 2,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TabsView(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ButtonGlobal(
                                      text: state.data.data.category.name,
                                      onTap: () {
                                        //call category api (osama)
                                      },
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    StarRating(
                                      rating: state.data.data.rate,
                                      starCount: 5,
                                      size: 30,
                                      color: GlobalColors.mainColor,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    TextGlobal(
                                      text:
                                          "(${state.data.data.rate.toString()})",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                )
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

  CartRow(String price) {
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
                    text: S.of(context).add_to_cart,
                    radius: 20,
                    padding: 30,
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

  TabsView() {
    return Column(
      children: [
        Image.network(
          "https://i.sstatic.net/45Aaj.png",
          height: 150,
        ),
        Container(
          height: 70,
          child: AppBar(
            centerTitle: true,
            title: Text("New Titile"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'State',
                ),
                Tab(
                  text: 'Mission',
                ),
                Tab(
                  text: 'Rocket',
                )
              ],
            ),
          ),
        ),
        Container(
          child: TabBarView(
            children: [
              Text(
                'Tab 1',
              ),
              Text('Tab 2'),
              Text('Tab 3')
            ],
          ),
        )
      ],
    );
  }
}
