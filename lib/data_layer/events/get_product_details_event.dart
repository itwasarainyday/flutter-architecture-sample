import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/data_layer/network/repositories/store_repository.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class GetProductDetailsEvent {
  final StoreRepository storeRepository;

  GetProductDetailsEvent({StoreRepository storeRepository})
      : storeRepository = storeRepository ?? StoreRepository();

  Future<Result<ProductDetails>> run(int productId) async {
    return await storeRepository.getProductDetails(productId);
  }
}
