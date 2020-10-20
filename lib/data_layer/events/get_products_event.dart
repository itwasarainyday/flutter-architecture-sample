import 'package:flutterarchitecturesample/data_layer/network/models/product.dart';
import 'package:flutterarchitecturesample/data_layer/network/repositories/store_repository.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class GetProductsEvent {
  final StoreRepository storeRepository;

  GetProductsEvent({StoreRepository storeRepository})
      : storeRepository = storeRepository ?? StoreRepository();

  Future<Result<List<Product>>> run() async {
    return await storeRepository?.getProducts();
  }
}
