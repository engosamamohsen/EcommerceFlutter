import 'package:Emend/app/routes/navigate_app_route.dart';
import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/cubit/address/address_cubit.dart';
import 'package:Emend/cubit/cart/cart_cubit.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/settings/settings_cubit.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/views/splash/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/product/product_cubit.dart';

// class ProductProvider with ChangeNotifier {
//   Product? selectedProduct;

//   void setProduct(Product product) {
//     selectedProduct = product;
//     notifyListeners();
//   }
// }

// ChangeNotifierProvider(
//       create: (_) => ProductProvider(),
//       child: MyApp(),
//     ),

void main() {
  runApp(const MyApp());
// flutter build web --release --no-pwa
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavigationCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => OrderCubit()),
          BlocProvider(create: (context) => SettingsCubit()),
          BlocProvider(
              create: (context) =>
                  AddressCubit()), // Provide your ProductCubit here
        ],
        child: MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          theme: ThemeData(useMaterial3: true),
          routerConfig: NavigateAppRoute.routes, // Use GoRouter here

          // home: const SplashView(),
        ));
  }
}
