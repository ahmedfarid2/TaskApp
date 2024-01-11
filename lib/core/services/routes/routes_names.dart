class RoutesNames {
  static String get appInit => '/';
  static String get connectionError => '/connection-error';
  static final ProductsRoutes products = ProductsRoutes();
}

class ProductsRoutes {
  String baseProducts = '/products';
  String get viewProducts => '$baseProducts/view-products';
  String get addProducts => '$baseProducts/add-products';
}
