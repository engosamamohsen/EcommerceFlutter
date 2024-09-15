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
import 'package:auth/views/address/list/addtress_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  List<AddressModel> addressList = [];
  int postionDeleted = -1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressCubit>().getAddressList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressStates>(
      listener: (context, state) {
        if (state is AddressSuccessState<AddressListResponse>) {
          //list
          setState(() {
            addressList = state.data.data!.data!;
          });
        }
        if (state is AddressSuccessState<BaseResponse>) {
          //delete
          if (postionDeleted != -1 && postionDeleted < addressList.length) {
            setState(() {
              addressList.removeAt(postionDeleted);
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar(
              title: S.of(context).my_address,
            ),
            body: state is AddressLoadingState
                ? const LoadingViewFull()
                : state is AddressSuccessState<AddressListResponse> ||
                        state is AddressSuccessState<BaseResponse>
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: addressList.length,
                            itemBuilder: (context, item) {
                              return AddressItem(
                                address: addressList[item],
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
                                        .delete(addressList[item].id);
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
                                text: S.of(context).loading_please_wait),
                          ));
      },
    );
  }
}
