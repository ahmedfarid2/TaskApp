class APIEndPoints {
  static const String baseApiUrl = "https://dummyjson.com/";

  static Products products = Products();
}

class Products {
  /// [Get Products]
  String getProducts(int limit, int skip) => "/products/?limit=$limit&skip=$skip";

  /// [add Products]
  String get addProducts => "/products/add";
}
