import 'package:flutterarchitecturesample/bloc_layer/bloc.dart';
import 'package:flutterarchitecturesample/bloc_layer/stateable.dart';
import 'package:flutterarchitecturesample/data_layer/events/get_products_event.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';

class GetProductsBloc extends Bloc with Stateable<List<Product>> {
  Future<void> getProducts() async {
    setState(Result.loading());
    setState(await GetProductsEvent().run());
  }
}
