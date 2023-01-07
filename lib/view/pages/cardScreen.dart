import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juniorflutterdevelopervacancytask/controller/cubit/ProductCubit.dart';
import 'package:juniorflutterdevelopervacancytask/controller/states/ProductState.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/checkoutScreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/widgets/item_widget.dart';

import '../../constants.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/favI_item_widget.dart';

class CardScreen extends StatefulWidget {
  static String id = 'CardScreen';
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    BlocProvider.of<ProductsCubit>(context).favoritesItem.toSet().toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        ProductsCubit controller = context.read<ProductsCubit>();
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 102,
            backgroundColor: blac2Color,
            onPressed: () {
              Navigator.pushNamed(context, CheckoutScreen.id);
            },
            label: const Text(
              'check out',
              style: TextStyle(
                color: m4Color,
                fontSize: 20,
                fontFamily: 'Nunito-ExtraBold',
              ),
            ),
          ),
          backgroundColor: m6Color,
          appBar: appBar(title: 'Basket'),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.favoritesItem.length,
                        itemBuilder: ((context, index) {
                          return FavItem(
                            count: controller.count[index],
                            model: controller.favoritesItem[index],
                            onTapToIncrease: () {
                              controller.IncrButton(index);
                            },
                            onTapToDecrease: () {
                              controller.DecButton(index);
                            },
                          );
                        })),
                  ),
                ],
              )),
        );
      },
    );
  }
}
