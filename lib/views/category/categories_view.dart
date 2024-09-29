import 'package:auth/component/app_bar/app.bar.global.dart';
import 'package:auth/component/emptyView/empty_view.dart';
import 'package:auth/component/network/loading_view_full.dart';
import 'package:auth/component/network/network_error_view.dart';
import 'package:auth/component/text/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/models/category/categories_response.dart';
import 'package:auth/models/category/category_model.dart';
import 'package:auth/views/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _DepartmentViewState();
}

class _DepartmentViewState extends State<CategoriesView> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().categories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is CategoriesSuccessState<CategoriesResponse>) {
          setState(() {
            if (state.data.data != null) {
              categories = state.data.data!.categories;
            }
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: GlobalColors.backGroundColor,
          appBar: GlobalAppBar(
            title: S.of(context).categories,
            showBackBtn: false,
          ),
          body: state is CategoriesLoadingState
              ? const LoadingViewFull()
              : state is CategoriesSuccessState
                  ? categories.isEmpty
                      ? EmptyView(
                          textMsg: S.of(context).your_categories_is_empty,
                        )
                      : GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: categories.length,
                          itemBuilder: (context, item) {
                            return CategoryItem(
                                name: categories[item].name,
                                image: categories[item].icon);
                          })
                  : state is FailedState
                      ? NetworkError()
                      : Center(
                          child: TextGlobal(
                              text: S.of(context).loading_please_wait),
                        ),
        );
      },
    );
  }
}
