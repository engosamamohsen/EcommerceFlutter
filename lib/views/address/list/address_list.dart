import 'package:Emend/app/app_color.dart';
import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/dialog/dialog_utils.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/cubit/address/address_cubit.dart';
import 'package:Emend/cubit/address/address_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/address/address_list_response.dart';
import 'package:Emend/models/address/address_model.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/views/address/add/add_address.dart';
import 'package:Emend/views/address/list/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListView extends StatefulWidget {
  AddressListView({super.key, this.addressList});
  List<AddressModel>? addressList;

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  int postionDeleted = -1;

  @override
  void initState() {
    super.initState();
    if (widget.addressList == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AddressCubit>().getAddressList();
      });
    }
  }

  Future<void> _refreshData() async {
    // Trigger a refresh of the data
    context.read<AddressCubit>().getAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressStates>(
      listener: (context, state) {
        if (state is AddressSuccessState<AddressListResponse>) {
          //list
          setState(() {
            widget.addressList = state.data.data!.data!;
          });
        }
        if (state is AddressSuccessState<BaseResponse>) {
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
              title: S.of(context).my_address,
              suffixIcon: Icons.add_circle_outline,
              onSuffixIconPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return AddAddressView();
                }));
              },
              onBackIconPressed: () {
                Navigator.pop(context, widget.addressList);
              },
            ),
            body: state is AddressLoadingState
                ? const LoadingViewFull()
                : RefreshIndicator(
                    onRefresh: _refreshData,
                    child: state is AddressSuccessState<AddressListResponse> ||
                            state is AddressSuccessState<BaseResponse> ||
                            widget.addressList != null
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: widget.addressList!.length,
                                itemBuilder: (context, item) {
                                  return AddressItem(
                                    address: widget.addressList![item],
                                    delete: () {
                                      setState(() {
                                        postionDeleted = item;
                                      });
                                      DialogUtils.showDialogSimple(
                                          context,
                                          S.of(context).delete,
                                          S
                                              .of(context)
                                              .do_you_want_delete_this_item,
                                          S.of(context).yes,
                                          S.of(context).no, () {
                                        BlocProvider.of<AddressCubit>(context)
                                            .delete(
                                                widget.addressList![item].id);
                                        Navigator.pop(context);
                                      }, () {
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                }))
                        : state is AddressFailedState
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
