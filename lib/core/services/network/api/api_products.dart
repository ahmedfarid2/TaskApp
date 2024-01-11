import 'package:taskapp/core/constants/constants.dart';
import 'package:taskapp/core/services/network/config/base_dio.dart';
import 'package:taskapp/core/services/network/config/end_points.dart';
import 'package:taskapp/modules/products/models/m_products.dart';

class ApiProducts {
  Future<MProducts> getAllProducts({int limit = 10, int skip = 0}) async {
    try {
      final response = await BaseDio.dio.get(
        APIEndPoints.products.getProducts(limit, skip),
      );
      if (Constants.constValues.successStatusCodes.contains(response.statusCode)) {
        return MProducts.fromJson(response.data);
      } else {
        throw Exception('Failed to retrieve products. Status code: ${response.statusCode}, Response: ${response.data}');
      }
    } catch (e, stackTrace) {
      throw Exception('Error occurred: $e --- $stackTrace');
    }
  }

  Future<MProduct> addProduct(MProduct product) async {
    try {
      final response = await BaseDio.dio.post(
        APIEndPoints.products.addProducts,
        data: product.toJson(),
      );

      if (Constants.constValues.successStatusCodes.contains(response.statusCode)) {
        return MProduct.fromJson(response.data);
      } else {
        throw Exception('Failed to submit appointment. Status code: ${response.statusCode}, Response: ${response.data}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}