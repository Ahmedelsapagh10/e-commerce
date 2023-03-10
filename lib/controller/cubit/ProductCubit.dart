import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';
import 'package:juniorflutterdevelopervacancytask/Provider/repository/repository.dart';
import 'package:juniorflutterdevelopervacancytask/constants.dart';
import 'package:juniorflutterdevelopervacancytask/controller/states/ProductState.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProducRepository producRepository;
  ProductsCubit(
    this.producRepository,
  ) : super(initState());

  TextEditingController textEditingController = TextEditingController();

  List<ProductModel> Products = [];

  List<ProductModel> getAllProducts() {
    emit(LoadingState());
    producRepository.getAllProducts().then((Products) {
      this.Products = Products;
      emit(LoadedState(Products: Products));
    });

    return Products;
  }

  ///
  ///

  String buttonText = 'add';
  List<ProductModel> favoritesItem = [];

  addToFavAndDelete({required ProductModel model}) {
    if (buttonText == 'add') {
      favoritesItem.add(model);
      buttonText = 'delete';
      favoritesItem.toSet().toList();
      emit(AddItemState());
    } else {
      favoritesItem.remove(model);
      buttonText = 'add';
      favoritesItem.toSet().toList();
      emit(DeleteItemState());
    }
  }

//search
  List<ProductModel> SearchedProducts = [];
  onChanged(String searched) {
    SearchedProducts = Products.where((proucts) {
      return proucts.title.toLowerCase().startsWith(searched);
    }).toList();
    emit(SearchedState());
  }

  List<int> count = List.filled(12, 0);

  IncrButton(index) {
    count[index]++;
    emit(addState());
  }

  DecButton(index) {
    count[index]--;
    emit(subState());
  }

  var getTotoalPrice;
  getAllPrice() {
    for (int i = 0; i < favoritesItem.length; i++) {
      getTotoalPrice = count[i] * favoritesItem[i].price;
    }
    return getTotoalPrice;
  }

  //
}
//
