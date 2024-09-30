import 'package:auth/cubit/order/order_cubit.dart';
import 'package:auth/cubit/order/order_state.dart';
import 'package:auth/models/order/order_list_response.dart';
import 'package:auth/models/order/order_response.dart';
import 'package:auth/views/order/order_item.dart';
import 'package:flutter/material.dart';

import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/dialog/dialog_utils.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/address/address_cubit.dart';
import 'package:auth/cubit/address/address_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:auth/models/address/address_list_response.dart';
import 'package:auth/models/response/base_response.dart';
import 'package:auth/views/address/add/add_address.dart';
import 'package:auth/views/address/list/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListView extends StatefulWidget {
  OrderListView({super.key, this.addressList});
  List<OrderModel>? addressList;

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  int postionDeleted = -1;

  @override
  void initState() {
    super.initState();
    if (widget.addressList == null) {
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
        if (state is OrderSuccessState<OrderListResponse>) {
          //list
          setState(() {
            widget.addressList = state.data?.data!.data!;
          });
        }
        if (state is OrderSuccessState<BaseResponse>) {
          //delete
          if (widget.addressList != null &&
              postionDeleted != -1 &&
              postionDeleted < widget.addressList!.length) {
            setState(() {
              widget.addressList!.removeAt(postionDeleted);
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: GlobalColors.backGroundColor,
            appBar: GlobalAppBar(
              title: S.of(context).my_orders,
            ),
            body: state is OrderLoadingState
                ? const LoadingViewFull()
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: state is OrderSuccessState<OrderListResponse> ||
                            state is OrderSuccessState<BaseResponse> ||
                            widget.addressList != null
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.addressList!.length,
                                itemBuilder: (context, item) {
                                  return OrderItem(
                                    order: widget.addressList![item],
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
