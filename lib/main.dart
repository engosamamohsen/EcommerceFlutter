import 'package:Emend/component/bottom_bar/bottom_navigation_cubit.dart';
import 'package:Emend/cubit/address/address_cubit.dart';
import 'package:Emend/cubit/cart/cart_cubit.dart';
import 'package:Emend/cubit/home/home_cubit.dart';
import 'package:Emend/cubit/order/order_cubit.dart';
import 'package:Emend/cubit/settings/settings_cubit.dart';
import 'package:Emend/generated/l10n.dart';
import 'package:Emend/utils/constants/constants.dart';
import 'package:Emend/widget/local/LocaleModel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as getx;
import 'package:meta_seo/meta_seo.dart';
import 'package:provider/provider.dart';

import 'app/routes/get_app_route.dart';
import 'cubit/product/product_cubit.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'db_helper/app_storage.dart';

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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //================handle web=========================
  usePathUrlStrategy();
  //
  if (kIsWeb) {
    MetaSEO().config();
  }
  //===============================================
  runApp(const MyApp());
// flutter build web --release --no-pwa
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LocaleModel localeModel = LocaleModel();

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    AppStorageShared appStorage = AppStorageShared();
    String? lang = await appStorage.readKey(TConstants.language);
    setState(() {
      localeModel.set(Locale(lang ?? 'ar'));
    });
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (context) => localeModel,
        child: Consumer<LocaleModel>(
            builder: (context, localeModel, child) =>
                MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) =>
                          BottomNavigationCubit()),
                      BlocProvider(create: (context) => HomeCubit()),
                      BlocProvider(create: (context) => ProductCubit()),
                      BlocProvider(create: (context) => CartCubit()),
                      BlocProvider(create: (context) => OrderCubit()),
                      BlocProvider(create: (context) => SettingsCubit()),
                      BlocProvider(
                          create: (context) =>
                              AddressCubit()), // Provide your ProductCubit here
                    ],
                    child:
                    Directionality(
                        textDirection: localeModel.locale?.languageCode == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr, child: GetMaterialApp(
                      defaultTransition: getx.Transition.cupertino,
                      initialRoute: '/',
                      locale: localeModel.locale,

                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: [Locale('en'), Locale('ar')],
                      debugShowCheckedModeBanner: false,
                      debugShowMaterialGrid: false,
                      theme: ThemeData(useMaterial3: true),
                      getPages: GetAppRoute.routes,

                      // routerConfig: GetAppRoute.routes, // Use GoRouter here

                      // home: const SplashView(),
                    )))

        ));
  }
}
// flutter run -d chrome --web-renderer html
