import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juniorflutterdevelopervacancytask/view/widgets/custom_textform_fiels.dart';

import '../../constants.dart';
import '../../controller/cubit/ProductCubit.dart';
import '../../controller/states/ProductState.dart';
import '../widgets/app_bar_widget.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'CheckoutScreen';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      ProductsCubit controller = context.read<ProductsCubit>();
      return Scaffold(
        backgroundColor: m6Color,
        appBar: appBar(
          title: 'check out',
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'PayMent Way !',
                  style: TextStyle(
                    color: mColor,
                    fontSize: 28,
                    fontFamily: 'Rajdhani',
                  ),
                ),
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/visa.png',
                          width: 50,
                        ),
                        Custom_Text_Field(
                          hintText: 'card number',
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Custom_Text_Field(
                                hintText: 'Exp Date',
                                textInputType: TextInputType.number,
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Custom_Text_Field(
                                hintText: 'CCV',
                                textInputType: TextInputType.number,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'or checkout with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: m4Color,
                ),
                child: Image.asset(
                  'assets/images/pay.png',
                  width: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: m4Color,
                ),
                child: Image.asset(
                  'assets/images/pay2.png',
                  width: 30,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // InkWell(
              //   onTap: () {
              //     print('Transfer money');
              //   },
              //   child: Container(
              //     height: 50,
              //     margin: const EdgeInsets.symmetric(
              //       horizontal: 30,
              //     ),
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 30,
              //     ),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         color: kPrimaryColor),
              //     child: Center(
              //         child: Text(
              //       'total Price : ${controller.getAllPrice()} ' r'$ ',
              //       style: const TextStyle(
              //         color: m6Color,
              //         fontSize: 22,
              //         fontFamily: 'Rajdhani',
              //       ),
              //     )),
              //   ),
              // ),
              // const SizedBox(
              //   height: 50,
              // ),
              InkWell(
                onTap: () {
                  print('Transfer money');
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kTextColor),
                  child: Center(
                      child: Text(
                    'Confirm Payment  ${controller.getAllPrice().toString()} '
                    r'$ ',
                    style: const TextStyle(
                      color: m6Color,
                      fontSize: 22,
                      fontFamily: 'Rajdhani',
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
