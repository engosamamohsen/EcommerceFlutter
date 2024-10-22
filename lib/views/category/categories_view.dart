import 'dart:math';

import 'package:Emend/component/app_bar/app.bar.global.dart';
import 'package:Emend/component/emptyView/empty_view.dart';
import 'package:Emend/component/network/loader_view.dart';
import 'package:Emend/component/network/loading_view_full.dart';
import 'package:Emend/component/network/network_error_view.dart';
import 'package:Emend/component/text/text_global.dart';
import 'package:Emend/utils/constants/color.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/home/home_state.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/models/category/categories_response.dart';
import 'package:Emend/models/category/category_model.dart';
import 'package:Emend/views/category/category_item.dart';
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
    final currentCount = (MediaQuery.of(context).size.width ~/ 250).toInt();
    final minCount = 4;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is CategoriesSuccessState<CategoriesResponse>) {
          print("categories start is here");
          setState(() {
            print("categories start is here ${state.data.data}");

            if (state.data.data != null) {
              categories = state.data.data!.categories;
              print("categories ${categories.length}");
            }
          });
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoadingState) return LoadingView();
        if (state is FailedState) return NetworkError();
        if (state is CategoriesSuccessState) {
          if (categories.isEmpty)
            return EmptyView(
              textMsg: S.of(context).your_categories_is_empty,
            );
          else {
            return SizedBox(
              height: 800,
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(categories.length, (index) {
                  return CategoryItem(
                    categoryId: categories[index].id,
                    name: categories[index].name,
                    image: categories[index].icon,
                  );
                })),
            );
          }
        } else {
          return Text('data');
        }
        return Container(
          child: state is CategoriesLoadingState
              ? const LoadingView()
              : state is CategoriesSuccessState
                  ? categories.isEmpty
                      ? EmptyView(
                          textMsg: S.of(context).your_categories_is_empty,
                        )
                      : Column(
                          children: [
                            Text("asdasasdasd"),
                            Text("asdasasdasd"),
                            Text("asdasasdasd"),
                            Text("asdasasdasd"),
                            Text("asdasasdasd"),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Text(
                                  "data",
                                  style: TextStyle(fontSize: 30),
                                );
                              },
                              itemCount: categories.length,
                            ),
                          ],
                        )
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
