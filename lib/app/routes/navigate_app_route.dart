import 'dart:ffi';

import 'package:Emend/app/routes/const_routes_url.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/views/address/add/add_address.dart';
import 'package:Emend/views/address/list/address_list.dart';
import 'package:Emend/views/auth/forget.password.view.dart';
import 'package:Emend/views/auth/login.view.dart';
import 'package:Emend/views/auth/register.view.dart';
import 'package:Emend/views/cart/cart_view.dart';
import 'package:Emend/views/category/categories_view.dart';
import 'package:Emend/views/checkout/checkout_view.dart';
import 'package:Emend/views/contactus/contact_us_view.dart';
import 'package:Emend/views/home/home_container.dart';
import 'package:Emend/views/home/home_view.dart';
import 'package:Emend/views/products/product_details.dart';
import 'package:Emend/views/profile/profile_view.dart';
import 'package:Emend/views/splash/splash.view.dart';
import 'package:Emend/views/wishlist/wishlist_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

class NavigateAppRoute {
  static final routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RouteUrlConst.SPLASH,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteUrlConst.LOGIN,
            builder: (BuildContext context, GoRouterState state) {
              return LoginView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.REGISTER,
            builder: (BuildContext context, GoRouterState state) {
              return RegisterView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.FORGET_PASSWORD,
            builder: (BuildContext context, GoRouterState state) {
              return ForgetPasswordView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.ADD_ADDRESS,
            builder: (BuildContext context, GoRouterState state) {
              return AddAddressView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.ADDRESS_LIST,
            builder: (BuildContext context, GoRouterState state) {
              return AddressListView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.CATEGORIES,
            builder: (BuildContext context, GoRouterState state) {
              return CategoriesView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.CONTACT_US,
            builder: (BuildContext context, GoRouterState state) {
              return ContactUsView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.HOME,
            builder: (BuildContext context, GoRouterState state) {
              return HomeContainer();
            },
          ),
          GoRoute(
            path: RouteUrlConst.WISHLIST,
            builder: (BuildContext context, GoRouterState state) {
              return const WishListView();
            },
          ),
//           final Map<String, dynamic> data = {
//   'carts': carts,
//   'totalAfterDiscount': totalAfterDiscount,
// };

// Navigate to the checkout route without including totalAfterDiscount in the URL
// context.go(
//   '/checkout',
//   extra: data,  // Pass the data via extra
// );
          GoRoute(
            path: RouteUrlConst.CART,
            builder: (BuildContext context, GoRouterState state) {
              return const CartView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.PROFILE,
            builder: (BuildContext context, GoRouterState state) {
              return ProfileView();
            },
          ),
          GoRoute(
            path: RouteUrlConst.CHECKOUT,
            builder: (BuildContext context, GoRouterState state) {
              final data = state.extra as Map<String, dynamic>;
              final List<CartModel> carts = data['carts'] as List<CartModel>;
              final double totalAfterDiscount =
                  data['totalAfterDiscount'] as double;

              // Accessing the dynamic 'id' // Retrieve Product from the extra argument
              return CheckoutView(
                  carts: carts, totalAfterDiscount: totalAfterDiscount);
            },
          ),
          GoRoute(
            path: RouteUrlConst.PRODUCT_DETAILS,
            builder: (BuildContext context, GoRouterState state) {
              final String id =
                  state.pathParameters['id']!; // Accessing the dynamic 'id'
              return ProductDetailsView(productId: int.parse(id));
            },
          ),
        ],
      ),
    ],
  );

  static void navigate(BuildContext context, String endPoint,
      {bool removePrev = false}) {
    switch (removePrev) {
      case true:
        context.pushReplacement(endPoint);
        break;
      default:
        context.go(endPoint);
    }
  }
}
