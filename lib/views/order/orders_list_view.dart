import 'package:Emend/app/navigate_app.dart';
import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/order/order_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/order/order_list_response.dart';
import 'package:Emend/models/order/order_model.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/views/order/order_details_view.dart';
import 'package:Emend/views/order/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListView extends StatefulWidget {
  OrderListView({super.key, this.orders});
  List<OrderModel>? orders;

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  int postionDeleted = -1;

  @override
  void initState() {
    super.initState();
    if (widget.orders == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<OrderCubit>().getOrders();
      });
    }
  }

  Future<void> _refreshData() async {
    // Trigger a refresh of the data
    context.read<OrderCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
      listener: (context, state) {
        if (state is OrderSuccessState<OrdersListResponse>) {
          //list
          setState(() {
            widget.orders = state.data?.data!.data;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: TColor.backGroundColor,
            appBar: GlobalAppBar(
              title: S.of(context).my_orders,
            ),
            body: state is OrderLoadingState
                ? const LoadingViewFull()
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: widget.orders != null
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.orders!.length,
                                itemBuilder: (context, item) {
                                  return OrderItem(
                                    order: widget.orders![item],
                                    selected: () {
                                      NavigateApp.navigate(
                                          context,
                                          OrderDetailsView(
                                              orderId:
                                                  widget.orders![item].id));
                                    },
                                  );
                                }))
                        : state is OrderFailedState
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
