
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
import 'package:Emend/views/order/orders_list_view.dart';
import 'package:Emend/views/products/product_details.dart';
import 'package:Emend/views/products/product_list_view.dart';
import 'package:Emend/views/profile/edit_profile.dart';
import 'package:Emend/views/profile/profile_view.dart';
import 'package:Emend/views/splash/splash.view.dart';
import 'package:Emend/views/wishlist/wishlist_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

class GetAppRoute {
  static final routes = [
    GetPage(name: RouteUrlConst.SPLASH, page: () => SplashView()),
    GetPage(name: RouteUrlConst.LOGIN, page: () => LoginView()),
    GetPage(name: RouteUrlConst.REGISTER, page: () => RegisterView()),
    GetPage(name: RouteUrlConst.FORGET_PASSWORD, page: () => ForgetPasswordView()),
    GetPage(name: RouteUrlConst.HOME, page: () => HomeContainer()), // look to home container which carry bottom navigation
    GetPage(name: RouteUrlConst.PRODUCT_DETAILS, page: () => ProductDetailsView(productId: int.parse(Get.parameters['product_id'] ?? '0'))),
    GetPage(name: RouteUrlConst.ADDRESS_LIST, page: () => AddressListView()),
    GetPage(name: RouteUrlConst.ADD_ADDRESS, page: () => AddAddressView()),
    GetPage(name: RouteUrlConst.CATEGORIES, page: () => CategoriesView()),
    GetPage(name: RouteUrlConst.CONTACT_US, page: () => ContactUsView()),
    GetPage(name: RouteUrlConst.CONTACT_US, page: () => ContactUsView()),
    GetPage(name: RouteUrlConst.WISHLIST, page: () => WishListView()),
    GetPage(name: RouteUrlConst.CART, page: () => CartView()),
    GetPage(name: RouteUrlConst.CHECKOUT, page: () => CheckoutView(carts: [], totalAfterDiscount: 0)),
    GetPage(name: RouteUrlConst.PROFILE, page: () => ProfileView()),
    GetPage(name: RouteUrlConst.EDIT_PROFILE, page: () => EditProfileView()),
    GetPage(name: RouteUrlConst.ORDER_LIST, page: () => OrderListView()),
    GetPage(name: RouteUrlConst.PRODUCT_LIST, page: () => ProductListView(categoryId: 0, categoryName: "")),
  ];

  static void push(BuildContext context, String endPoint,
      {bool removePrev = false,Map<String, String> parameter = const {}}) {
    switch (removePrev) {
      case true:
        Get.offAllNamed(endPoint);
        break;
      default:{
        if(parameter.isEmpty) {
          Get.toNamed(endPoint);
        } else{
          Get.toNamed(endPoint,parameters: parameter);
        }
      }
    }
  }


  static void pop(BuildContext context) {
    print("object back");
    if (GoRouter.of(context).canPop()) {
      print("object back ttooo");
      Get.back();
    } else {
      print("object back splash");
      // Handle cases where there's no route to pop (maybe go to a default page)
      Get.toNamed(RouteUrlConst.SPLASH);
    }
  }
}
