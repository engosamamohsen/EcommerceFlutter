import 'package:auth/cubit/address/address_cubit.dart';
import 'package:auth/cubit/cart/cart_cubit.dart';
import 'package:auth/cubit/home/home_cubit.dart';
import 'package:auth/generated/l10n.dart';
import 'package:auth/views/splash/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/product/product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
            create: (context) =>
                AddressCubit()), // Provide your ProductCubit here
      ],
      child: MaterialApp(
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
        home: SplashView(),
      ),
    );
  }
}
