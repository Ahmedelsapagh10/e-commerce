import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';
import 'package:juniorflutterdevelopervacancytask/controller/cubit/ProductCubit.dart';
import 'package:juniorflutterdevelopervacancytask/controller/states/ProductState.dart';

import '../../constants.dart';

class customCard extends StatelessWidget {
  ProductModel model;
  customCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            decoration: BoxDecoration(
                color: whitColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                    blurRadius: 5,
                  )
                ]),
            child: Column(
              children: [
                Flexible(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        // top: 50,
                        left: 5,
                        bottom: 0,
                        child: Text(
                          model.title.substring(0, 10),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 20,
                        child: Image.network(
                          model.image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.black,
                  height: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${model.price.toString()}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.text, this.OnTap, this.icon, this.color = m3Color});

  String? text;
  IconData? icon;
  Color? color;
  VoidCallback? OnTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: OnTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color!, width: 5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: const TextStyle(
                    color: m6Color,
                    fontFamily: 'Nunito-ExtraBold',
                    fontSize: 18),
              ),
              Icon(
                icon,
                color: m6Color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
