import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/cubit/address/address_cubit.dart';
import 'package:auth/cubit/address/address_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/address_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
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
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar(
              title: S.of(context).my_address,
            ),
            body: state is AddressLoadingState
                ? const LoadingViewFull()
                : state is AddressSuccessState<AddressListResponse>
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // 2 items per row
                              crossAxisSpacing: 8.0, // spacing between columns
                              mainAxisSpacing: 8.0, // spacing between rows
                            ),
                            itemCount: state.data.data!.data!.length,
                            itemBuilder: (context, item) {
                              return Text("welcome");
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
