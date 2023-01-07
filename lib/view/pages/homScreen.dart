import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:juniorflutterdevelopervacancytask/constants.dart';
import 'package:juniorflutterdevelopervacancytask/controller/cubit/ProductCubit.dart';
import 'package:juniorflutterdevelopervacancytask/controller/states/ProductState.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/cardscreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/detailScreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/widgets/item_widget.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/searchfield.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      ProductsCubit controller = context.read<ProductsCubit>();

      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            heroTag: 'a',
            backgroundColor: blac2Color,
            onPressed: () {
              BlocProvider.of<ProductsCubit>(context)
                  .favoritesItem
                  .toSet()
                  .toList();
              setState(() {});
              Navigator.pushNamed(context, CardScreen.id);
            },
            label: const Text(
              'Card',
              style: TextStyle(
                color: m4Color,
                fontSize: 22,
              ),
            )),
        backgroundColor: m6Color,
        appBar: appBar(title: 'TOP STORE'),
        body: Column(
          children: [
            search(
              controller: controller.textEditingController,
              onChanged:
                  controller.onChanged(controller.textEditingController.text),
            ),
            Flexible(
              child: Container(
                // height: 200,
                child: GridView.builder(
                  itemCount: controller.textEditingController.text.isEmpty
                      ? controller.Products.length
                      : controller.SearchedProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          //   Navigator.pushNamed(context, DetailScreen.id);
                          controller.buttonText = 'add';
                          Navigator.pushNamed(context, DetailScreen.id,
                              arguments:
                                  controller.textEditingController.text.isEmpty
                                      ? controller.Products[index]
                                      : controller.SearchedProducts[index]);
                        },
                        child: customCard(
                          model: controller.textEditingController.text.isEmpty
                              ? controller.Products[index]
                              : controller.SearchedProducts[index],
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
