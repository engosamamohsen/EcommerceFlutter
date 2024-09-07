import 'package:auth/component/slider/slider_view.dart';
import 'package:auth/component/text.form.global.dart';
import 'package:auth/component/text_global.dart';
import 'package:auth/core/app_color.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/utils/global.assets.dart';
import 'package:auth/views/home/home_category_product.dart';
import 'package:auth/views/home/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            HomeBar(),
            const SizedBox(height: 30),
            SliderView(),
            const SizedBox(height: 30),
            HomeCategoryProduct(title: "welcome")
          ]),
        ),
      ),
    );
  }
}

class HomeBar extends StatelessWidget {
  HomeBar({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextGlobal(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                text: "${S.of(context).welcome_in} ${S.of(context).app_name}"),
            Icon(
              Icons.circle_notifications,
              size: 40,
              color: GlobalColors.mainColor,
            )
          ],
        ),
        const SizedBox(height: 10),
        TextFormGlobal(
            hint: S.of(context).search,
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            controller: searchController)
      ],
    );
  }
}
