import 'package:dio/dio.dart';
import 'package:flutterarchitecturesample/data_layer/network/dio_utils.dart';

class ApiRequest {
  String url;
  String httpMethod;

  ApiRequest(this.url, this.httpMethod);
}

class ApiClient {
  final baseUrl = "https://example-api.asdf/";
  final dio = DioUtils.createDio();

  Future<Map<String, dynamic>> getProducts() async {
    await Future.delayed(Duration(seconds: 2));
    return _mockGetProducts();

    return _send(ApiRequest("getProducts", "GET"));
  }

  Future<Map<String, dynamic>> getProductDetails(int productId) async {
    return _mockProductDetails(productId);

    return _send(ApiRequest("getProductDetails/$productId", "GET"));
  }

  Future<Map<String, dynamic>> _send(ApiRequest request) async {
    final Response<Map<String, dynamic>> result = await dio.request(
      request.url,
      options: RequestOptions(
        method: request.httpMethod,
        contentType: 'application/json',
        baseUrl: baseUrl,
      ),
    );

    return result.statusCode == 200 ? result.data : throw result;
  }
}

Map<String, dynamic> _mockGetProducts() => {
      "products": [
        {"id": 1, "name": "Pencil"},
        {"id": 2, "name": "Paper"},
        {"id": 3, "name": "Lunch Box"},
        {"id": 4, "name": "Text Book"},
        {"id": 5, "name": "iPhone"},
        {"id": 6, "name": "Google Pixel"},
        {"id": 7, "name": "Watermelon"},
        {"id": 8, "name": "Sugar"},
        {"id": 9, "name": "Bag of Coffee Beans"},
        {"id": 10, "name": "University Degree"},
      ],
    };

Map<String, dynamic> _mockProductDetails(int productId) {
  switch (productId) {
    case 1:
      return {
        "id": 1,
        "name": "Pencil",
        "description": "A utensil to write with.",
        "price": 1.0,
      };
    case 2:
      return {
        "id": 2,
        "name": "Paper",
        "description": "An object to write on. Or to light on fire.",
        "price": 0.1,
      };
    case 3:
      return {
        "id": 3,
        "name": "Lunch Box",
        "description": "A box to hold your lunch.",
        "price": 5.0,
      };
    case 4:
      return {
        "id": 4,
        "name": "Text Book",
        "description": "Our special book of text.",
        "price": 150.0,
      };
    case 5:
      return {
        "id": 5,
        "name": "iPhone",
        "description": "i phone, you phone, we all phone.",
        "price": 999.0,
      };
    case 6:
      return {
        "id": 6,
        "name": "Google Pixel",
        "description": "Featuring 1080x1920 pixels.",
        "price": 1000.0,
      };
    case 7:
      return {
        "id": 7,
        "name": "Watermelon",
        "description": "Sugar (high) x4",
        "price": 3.0,
      };
    case 8:
      return {
        "id": 8,
        "name": "Sugar",
        "description": "But without the watermelon.",
        "price": 2.99,
      };
    case 9:
      return {
        "id": 9,
        "name": "Coffee Beans",
        "description": "A love or a hate,\nan addiction without flaw,\nto dirty water.\n\n",
        "price": 1.0,
      };
    default:
      return {
        "id": 10,
        "name": "University Degree",
        "description": "You'll need this.",
        "price": 50000.0,
      };
  }
}
