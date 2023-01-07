import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:juniorflutterdevelopervacancytask/Provider/models/product_mode.dart';
import 'package:juniorflutterdevelopervacancytask/controller/cubit/ProductCubit.dart';
import 'package:juniorflutterdevelopervacancytask/controller/states/ProductState.dart';
import 'package:juniorflutterdevelopervacancytask/view/pages/cardScreen.dart';
import 'package:juniorflutterdevelopervacancytask/view/widgets/item_widget.dart';

import '../../constants.dart';

class DetailScreen extends StatefulWidget {
  static String id = 'DetailScreen';
  const DetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).buttonText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel p = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                heroTag: 'b',
                backgroundColor: blac2Color,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    CardScreen.id,
                  );
                },
                label: const Text(
                  'Card',
                  style: TextStyle(
                    color: m4Color,
                    fontSize: 22,
                  ),
                )),
            body: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: whitColor,
                expandedHeight: MediaQuery.of(context).size.width / 0.9,
                pinned: true,
                stretch: true,
                floating: false,
                snap: false,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: DefaultTextStyle(
                      style: GoogleFonts.getFont(
                        'Almarai',
                        fontSize: 18,
                        color: kTextColor,
                        backgroundColor: whitColor,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                          repeatForever: false,
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              p.title.substring(0, 10),
                            )
                          ])),
                  centerTitle: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? false
                      : true,
                  background: Hero(
                    tag: p.id,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: ClipRRect(
                        clipBehavior: Clip.none,
                        child: Image.network(
                          p.image,
                          width: 50,

                          //fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                        height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                          color: m4Color,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: kDefaultPadding, left: kDefaultPadding),
                              child: Text(
                                //  r'$' 'السعر ' + p.price.toString(),
                                r'$ ' + p.price.toString(),
                                style: GoogleFonts.getFont(
                                  'Almarai',
                                  fontSize: 18,
                                  color: m5Color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //   margin: const EdgeInsets.all(kDefaultPadding),
                              padding: EdgeInsets.all(kDefaultPadding),
                              child: Text(p.description,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 8,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.clip,
                                    color: m3Color,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text(
                                p.category,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Almarai',
                                  fontSize: 18,
                                  color: m5Color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            MyButton(
                              color: BlocProvider.of<ProductsCubit>(context)
                                          .buttonText ==
                                      'add'
                                  ? m3Color
                                  : Colors.red,
                              icon: BlocProvider.of<ProductsCubit>(context)
                                          .buttonText ==
                                      'add'
                                  ? Icons.add
                                  : Icons.delete,
                              OnTap: () {
                                // BlocProvider.of<ProductsCubit>(context).checkif(
                                //     BlocProvider.of<ProductsCubit>(context)
                                //         .favoritesItem,
                                //     p);
                                BlocProvider.of<ProductsCubit>(context)
                                    .addToFavAndDelete(model: p);
                              },
                              text: BlocProvider.of<ProductsCubit>(context)
                                  .buttonText,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
