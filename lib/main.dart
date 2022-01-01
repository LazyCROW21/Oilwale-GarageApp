import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_app/components/addvehicleform.dart';
import 'package:garage_app/screens/garage/PurdchaseHistory.dart';
import 'package:garage_app/screens/garage/ShowProductsbought.dart';
import 'package:garage_app/screens/garage/cart.dart';
import 'package:garage_app/screens/garage/garage_scaffold.dart';
import 'package:garage_app/screens/garage/offerdetails.dart';
import 'package:garage_app/screens/garage/offers.dart';
import 'package:garage_app/screens/login.dart';
import 'package:garage_app/screens/logout.dart';
import 'package:garage_app/theme/themedata.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: AppColorSwatche.white,
      statusBarColor: Colors.transparent));
  runApp(MaterialApp(
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
    },
  ));
}
