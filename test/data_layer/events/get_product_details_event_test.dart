import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecturesample/data_layer/events/get_product_details_event.dart';
import 'package:flutterarchitecturesample/data_layer/network/models/product_details.dart';
import 'package:flutterarchitecturesample/data_layer/network/repositories/store_repository.dart';
import 'package:flutterarchitecturesample/data_layer/result.dart';
import 'package:mockito/mockito.dart';

/// A test example for Events

class MockStoreRepository extends Mock implements StoreRepository {}

void main() {
  final mockStoreRepository = MockStoreRepository();

  test('totalPrice returns the price of all items in the cart', () async {
    final getProductDetailsEvent = GetProductDetailsEvent(
      storeRepository: mockStoreRepository,
    );
    final expectedProduct = ProductDetails(id: 1001);

    when(mockStoreRepository.getProductDetails(expectedProduct.id))
        .thenAnswer((_) async => Result.success(expectedProduct));

    final result = await getProductDetailsEvent.run(expectedProduct.id);

    expect(result.data?.id, expectedProduct.id);
  });
}
