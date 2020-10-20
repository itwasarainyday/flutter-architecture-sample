
import 'package:flutterarchitecturesample/bloc_layer/bloc.dart';
import 'package:flutterarchitecturesample/bloc_layer/stateable.dart';
import 'package:flutterarchitecturesample/data_layer/events/get_product_details_event.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class ProductDetailsBloc extends Bloc with Stateable<ProductDetails> {
  Future<void> getProductDetails(int productId) async {
    setState(Result.loading());
    setState(await GetProductDetailsEvent().run(productId));
  }
}