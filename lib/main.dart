import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/cardscreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/checkoutScreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/detailscreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/homScreen.dart';

import 'Provider/repository/repository.dart';
import 'Provider/webservices/webServices.dart';
import 'controller/cubit/ProductCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductsCubit(
            ProducRepository(productsWebServices: ProductsWebServices())),
        child: MaterialApp(
          title: 'TOP STORE',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          initialRoute: HomeScreen.id,
          routes: {
            DetailScreen.id: (context) => const DetailScreen(),
            CardScreen.id: (context) => const CardScreen(),
            CheckoutScreen.id: (context) => const CheckoutScreen(),
            HomeScreen.id: (context) => const HomeScreen()
          },
          debugShowCheckedModeBanner: false,
        ));
  }
}
