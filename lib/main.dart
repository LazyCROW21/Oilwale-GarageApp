import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_app/providers/cartprovider.dart';
import 'package:garage_app/screens/garage/account/PurdchaseHistory.dart';
import 'package:garage_app/screens/garage/account/showproductsbought.dart';
import 'package:garage_app/screens/garage/product/cart.dart';
import 'package:garage_app/screens/garage/garage_scaffold.dart';
import 'package:garage_app/screens/garage/offer/offerdetails.dart';
import 'package:garage_app/screens/garage/offer/offers.dart';
import 'package:garage_app/screens/login.dart';
import 'package:garage_app/screens/logout.dart';
import 'package:garage_app/theme/themedata.dart';
import 'package:garage_app/screens/garage/product/productDetails.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: AppColorSwatche.white,
      statusBarColor: Colors.transparent));
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: GarageApp()));
}

class GarageApp extends StatelessWidget {
  const GarageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: AppColorSwatche.primary,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColorSwatche.primary,
              secondary: AppColorSwatche.primaryAccent,
              brightness: Brightness.light,
            ),
        // accentColor: AppColorSwatche.primary,
        highlightColor: AppColorSwatche.primary,
      ),
      initialRoute: '/login',
      home: LoginScreen(),
      routes: {
        // '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/logout': (context) => LogoutScreen(),
        '/garage_home': (context) => GarageScaffold(),
        '/garage_offers': (context) => OffersPage(),
        '/cart': (context) => CartPage(),
        '/offer_details': (context) => OfferDetails(),
        '/garage_history': (context) => PurchaseHistory(),
        '/purchased_product': (context) => ShowProductbought(),
        '/cust_product': (context) => ProductDetails(),
      },
    );
  }
}
