import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:juniorflutterdevelopervacancytask/constants.dart';

class ProductsWebServices {
  late Dio dio;
  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 20000,
      connectTimeout: 20000,
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
