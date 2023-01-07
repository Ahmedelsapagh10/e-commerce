import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';

abstract class ProductsState {}

class initState extends ProductsState {}

class LoadingState extends ProductsState {}

class AddItemState extends ProductsState {}

class DeleteItemState extends ProductsState {}

class xxState extends ProductsState {}

class addState extends ProductsState {}

class subState extends ProductsState {}

class SearchedState extends ProductsState {}

class LoadedState extends ProductsState {
  final List<ProductModel> Products;
  LoadedState({
    required this.Products,
  });
}
