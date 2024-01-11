import 'package:flutter/material.dart';
import 'package:taskapp/core/services/routes/routes_names.dart';
import 'package:taskapp/modules/core/presentation/screens/sn_splash.dart';
import 'package:taskapp/modules/products/presentation/screens/sn_add_products.dart';
import 'package:taskapp/modules/products/presentation/screens/sn_products.dart';

/// [Routes] is a class that contains all the routes in the app.
class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      //------------- Products Routes -------------//
      RoutesNames.appInit: (context) => const SNSplash(),
      RoutesNames.products.viewProducts: (context) => const SNProducts(),
      RoutesNames.products.addProducts: (context) => const SNAddProducts(),
      //------------- End Products Routes -------------//
    };
  }
}
