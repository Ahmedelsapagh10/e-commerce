import 'package:dio/dio.dart';
import 'package:juniorflutterdevelopervacancytask/constants.dart';

class ProductsWebServices {
  late Dio dio;
  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(microseconds: 20000),
      connectTimeout: const Duration(microseconds: 20000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
