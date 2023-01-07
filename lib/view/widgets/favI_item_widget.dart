import 'package:flutter/material.dart';

import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';

import '../../constants.dart';

class FavItem extends StatelessWidget {
  ProductModel model;
  final Function()? onTapToIncrease;
  final Function()? onTapToDecrease;
  final int count;
  FavItem({
    Key? key,
    required this.model,
    this.onTapToIncrease,
    this.onTapToDecrease,
    required this.count,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                //     clipBehavior: Clip.none,
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
                    top: 10,
                    child: Image.network(
                      model.image,
                      // height: 70,
                      width: 50,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                    heroTag: model.id,
                    backgroundColor: m6Color,
                    onPressed: onTapToDecrease,
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 24,
                        color: mColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${model.price.toString()}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        color: mColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                FloatingActionButton.small(
                    heroTag: model.price,
                    backgroundColor: m6Color,
                    onPressed: onTapToIncrease,
                    child: const Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: mColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            Container(
              child: Text(
                'Total Price : ${count * model.price}',
                style: const TextStyle(color: m5Color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
