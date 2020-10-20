import 'package:flutterarchitecturesample/data_layer/network/api_client.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class StoreRepository {
  ApiClient client = ApiClient();

  Future<Result<List<Product>>> getProducts() async {
    return await client
        .getProducts()
        .then((json) => Result.success((json['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList()))
        .catchError((error) => Result.error(error.toString()));
  }

  Future<Result<ProductDetails>> getProductDetails(int productId) async {
    return await client
        .getProductDetails(productId)
        .then((json) => Result.success(ProductDetails.fromJson(json)))
        .catchError((error) => Result.error(error.toString()));
  }
}
