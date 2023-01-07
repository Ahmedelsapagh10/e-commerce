import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';
import 'package:juniorflutterdevelopervacancytask/Provider/webservices/webServices.dart';

class ProducRepository {
  final ProductsWebServices productsWebServices;

  ProducRepository({required this.productsWebServices});

  Future<List<ProductModel>> getAllProducts() async {
    List data = await productsWebServices.getAllProducts();
    print(data);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}
