import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/button.global.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/cubit/address/address_cubit.dart';
import 'package:auth/cubit/address/address_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/address/add_address_request.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:auth/models/address/governates_response.dart';
import 'package:auth/utils/toast_message.dart';
import 'package:auth/views/address/add/drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressView();
}

class _AddAddressView extends State<AddAddressView> {
  AppStorage appStorage = AppStorage();
  int customer_id = 0;
  int selectedGovenrateId = 0;
  int selectedCityId = 0;
  int selectedGovenrateIndex = 0;
  List<String> governates = [];
  List<String> cities = [];
  List<Governorates> governatesModel = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressCubit>().getGovernates();
    });
    appStorage.getUser().then((onValue) {
      if (onValue.data?.id != null) {
        setState(() {
          customer_id = onValue.data!.id!;
        });
      }
    });
  }

  final TextEditingController governateId = TextEditingController();
  final TextEditingController cityId = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController street = TextEditingController();

  final TextEditingController building = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController flat = TextEditingController();

  final TextEditingController special_sign = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeCities(List<Cities> selectedCities) {
    setState(() {
      cities.clear();
      selectedCities.asMap().forEach((key, city) => cities.add(city.name!));
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressStates>(
      listener: (context, state) {
        if (state is AddressSuccessState<GovernoratesResponse>) {
          state.data.data?.data
              ?.asMap()
              .forEach((key, element) => governates.add(element.name!));
          if (governates.isNotEmpty) {
            governatesModel.addAll(state.data.data!.data!);
            selectedGovenrateId = governatesModel[selectedGovenrateIndex].id!;
            changeCities(governatesModel[selectedGovenrateIndex].cities!);
          }
        } else if (state is AddressSuccessState<AddAddressResponse>) {
          print("addedd success");
          ToastMessageHelper.showToastMessage(state.data.message);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar(
              title: S.of(context).add_address,
            ),
            body: state is AddressLoadingState
                ? const LoadingViewFull()
                : state is AddressSuccessState<GovernoratesResponse> ||
                        state is AddressLoadingButtonState ||
                        state is AddressInitState
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                DropdownMenuGlobal(
                                  hint: S.of(context).governate,
                                  items: governates,
                                  selected: (index) {
                                    setState(() {
                                      selectedGovenrateIndex = index;
                                      selectedGovenrateId =
                                          governatesModel[index].id!;
                                      changeCities(
                                          governatesModel[index].cities!);
                                      selectedCityId = 0;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownMenuGlobal(
                                  hint: S.of(context).city,
                                  items: cities,
                                  selected: (index) {
                                    setState(() {
                                      selectedCityId = governatesModel[
                                              selectedGovenrateIndex]
                                          .cities![index]
                                          .id!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).area,
                                    textInputType: TextInputType.text,
                                    obscureText: false,
                                    controller: area),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).street,
                                    textInputType: TextInputType.name,
                                    obscureText: false,
                                    controller: street),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).building,
                                    textInputType: TextInputType.name,
                                    obscureText: false,
                                    controller: building),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).floor,
                                    textInputType: TextInputType.number,
                                    obscureText: false,
                                    controller: floor),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).flat,
                                    textInputType: TextInputType.number,
                                    obscureText: false,
                                    controller: flat),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormGlobal(
                                    hint: S.of(context).special_sign,
                                    textInputType: TextInputType.name,
                                    obscureText: false,
                                    controller: special_sign),
                                SizedBox(
                                  height: 10,
                                ),
                                ButtonGlobal(
                                  showProgress:
                                      state is AddressLoadingButtonState
                                          ? true
                                          : false,
                                  text: S.of(context).submit,
                                  onTap: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      if (selectedCityId == 0) {
                                        ToastMessageHelper.showErrorMessage(
                                            "${S.of(context).please_enter} ${S.of(context).city}");
                                      }
                                      // Form is valid, proceed with sign in
                                      //call api
                                      BlocProvider.of<AddressCubit>(context)
                                          .addAddress(AddAddressRequest(
                                              customer_id: customer_id,
                                              governorate_id:
                                                  selectedGovenrateId,
                                              city_id: selectedCityId,
                                              area: area.text,
                                              street: street.text,
                                              building: building.text,
                                              floor: floor.text,
                                              flat: flat.text,
                                              special_sign: special_sign.text));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
