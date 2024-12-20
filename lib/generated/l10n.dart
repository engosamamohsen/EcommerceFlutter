// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ceraj`
  String get app_name {
    return Intl.message(
      'Ceraj',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message(
      'EGP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Code`
  String get confirm_code {
    return Intl.message(
      'Confirm Code',
      name: 'confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Login To Your Account`
  String get login_to_your_account {
    return Intl.message(
      'Login To Your Account',
      name: 'login_to_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an Account? `
  String get dont_have_account {
    return Intl.message(
      'Dont have an Account? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message(
      'OTP',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Flash Sale`
  String get flash_sale {
    return Intl.message(
      'Flash Sale',
      name: 'flash_sale',
      desc: '',
      args: [],
    );
  }

  /// `Most Sale`
  String get most_sale {
    return Intl.message(
      'Most Sale',
      name: 'most_sale',
      desc: '',
      args: [],
    );
  }

  /// `Newest Products`
  String get newest_products {
    return Intl.message(
      'Newest Products',
      name: 'newest_products',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get product_details {
    return Intl.message(
      'Product Details',
      name: 'product_details',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Privacy And Policy`
  String get privacy_and_policy {
    return Intl.message(
      'Privacy And Policy',
      name: 'privacy_and_policy',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancel_order {
    return Intl.message(
      'Cancel Order',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get is_required {
    return Intl.message(
      'is required',
      name: 'is_required',
      desc: '',
      args: [],
    );
  }

  /// `Welcome in`
  String get welcome_in {
    return Intl.message(
      'Welcome in',
      name: 'welcome_in',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Network Error Please Try Again`
  String get network_error {
    return Intl.message(
      'Network Error Please Try Again',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `Please Make A new Account`
  String get please_make_new_account {
    return Intl.message(
      'Please Make A new Account',
      name: 'please_make_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email address`
  String get please_enter_valid_email {
    return Intl.message(
      'Please enter valid email address',
      name: 'please_enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your OTP had been sent to you`
  String get please_enter_your_otp_had_been_sent_to_you {
    return Intl.message(
      'Please Enter Your OTP had been sent to you',
      name: 'please_enter_your_otp_had_been_sent_to_you',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email Address You Will recieve a link will recieve a link create a new password via email`
  String get please_enter_your_email_address_you_will {
    return Intl.message(
      'Please Enter Your Email Address You Will recieve a link will recieve a link create a new password via email',
      name: 'please_enter_your_email_address_you_will',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Manage Address`
  String get manage_address {
    return Intl.message(
      'Manage Address',
      name: 'manage_address',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Search in`
  String get search_in {
    return Intl.message(
      'Search in',
      name: 'search_in',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get add_to_cart {
    return Intl.message(
      'Add To Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total_price {
    return Intl.message(
      'Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `Loading Please Wait ....`
  String get loading_please_wait {
    return Intl.message(
      'Loading Please Wait ....',
      name: 'loading_please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Add Adress`
  String get add_address {
    return Intl.message(
      'Add Adress',
      name: 'add_address',
      desc: '',
      args: [],
    );
  }

  /// `Governate`
  String get governate {
    return Intl.message(
      'Governate',
      name: 'governate',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get building {
    return Intl.message(
      'Building',
      name: 'building',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Flat`
  String get flat {
    return Intl.message(
      'Flat',
      name: 'flat',
      desc: '',
      args: [],
    );
  }

  /// `area`
  String get area {
    return Intl.message(
      'area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `Special Sign`
  String get special_sign {
    return Intl.message(
      'Special Sign',
      name: 'special_sign',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter`
  String get please_enter {
    return Intl.message(
      'Please Enter',
      name: 'please_enter',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get my_address {
    return Intl.message(
      'My Addresses',
      name: 'my_address',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get your_address {
    return Intl.message(
      'Your Address',
      name: 'your_address',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want delete this item?`
  String get do_you_want_delete_this_item {
    return Intl.message(
      'Do you want delete this item?',
      name: 'do_you_want_delete_this_item',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get update_profile {
    return Intl.message(
      'Update Profile',
      name: 'update_profile',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Techincal Info`
  String get tech_info {
    return Intl.message(
      'Techincal Info',
      name: 'tech_info',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get your_cart_is_empty {
    return Intl.message(
      'Your cart is empty',
      name: 'your_cart_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Your Favorite is empty`
  String get your_favorite_is_empty {
    return Intl.message(
      'Your Favorite is empty',
      name: 'your_favorite_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Your categories is empty`
  String get your_categories_is_empty {
    return Intl.message(
      'Your categories is empty',
      name: 'your_categories_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Please select your address`
  String get please_select_your_address {
    return Intl.message(
      'Please select your address',
      name: 'please_select_your_address',
      desc: '',
      args: [],
    );
  }

  /// `If you have any inquries get in touch with us.`
  String get contact_us_msg {
    return Intl.message(
      'If you have any inquries get in touch with us.',
      name: 'contact_us_msg',
      desc: '',
      args: [],
    );
  }

  /// `we'll be happy to help you.`
  String get we_will_help_you {
    return Intl.message(
      'we\'ll be happy to help you.',
      name: 'we_will_help_you',
      desc: '',
      args: [],
    );
  }

  /// `Make Order`
  String get make_order {
    return Intl.message(
      'Make Order',
      name: 'make_order',
      desc: '',
      args: [],
    );
  }

  /// `Shipping within a week, excluding holidays.`
  String get shipping_within_a_week_excluding_holidays {
    return Intl.message(
      'Shipping within a week, excluding holidays.',
      name: 'shipping_within_a_week_excluding_holidays',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get continue_shopping {
    return Intl.message(
      'Continue Shopping',
      name: 'continue_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Your order will be delivered soon.`
  String get your_order_will_be_delivered_soon {
    return Intl.message(
      'Your order will be delivered soon.',
      name: 'your_order_will_be_delivered_soon',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for choosing our restart!`
  String get thank_you_for_choosing_our_app {
    return Intl.message(
      'Thank you for choosing our restart!',
      name: 'thank_you_for_choosing_our_app',
      desc: '',
      args: [],
    );
  }

  /// `Create order`
  String get create_order {
    return Intl.message(
      'Create order',
      name: 'create_order',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `In the way`
  String get in_the_way {
    return Intl.message(
      'In the way',
      name: 'in_the_way',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get order_number {
    return Intl.message(
      'Order Number',
      name: 'order_number',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Address Info`
  String get address_info {
    return Intl.message(
      'Address Info',
      name: 'address_info',
      desc: '',
      args: [],
    );
  }

  /// `Payment Info`
  String get payment_info {
    return Intl.message(
      'Payment Info',
      name: 'payment_info',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Qty`
  String get qty {
    return Intl.message(
      'Qty',
      name: 'qty',
      desc: '',
      args: [],
    );
  }

  /// `Order Info`
  String get order_info {
    return Intl.message(
      'Order Info',
      name: 'order_info',
      desc: '',
      args: [],
    );
  }

  /// `Items Info`
  String get items_info {
    return Intl.message(
      'Items Info',
      name: 'items_info',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
