//import 'package:firebase_tutorial_one/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/provider/providers.dart';
import '../widgets.dart';

//enum ProductControl { wishlist, cart }

class ProductCardList extends StatelessWidget {
  final ProductsControl controls;

  //final String id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final List<String> sizes;

  const ProductCardList(
      {Key? key,
      required this.controls,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.sizes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ShadowWidget(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: colors[1], borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.width / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelWidget(
                            label: name,
                            size: Sizes.p16,
                            fontWeight: FontWeight.bold,
                          ),
                          LabelWidget(
                            label: category,
                            size: Sizes.p14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LabelWidget(
                                label: '\$ ${price.toString()}',
                                size: Sizes.p16,
                                fontWeight: FontWeight.bold,
                              ),
                              Builder(builder: (context) {
                                if (controls is CartControl) {
                                  return Row(
                                    children: [
                                      const LabelWidget(
                                          label: 'Sizes',
                                          size: Sizes.p16,
                                          fontWeight: FontWeight.w600),
                                      LabelWidget(
                                          label: sizes.toString(),
                                          size: Sizes.p16,
                                          fontWeight: FontWeight.w600)
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  controls
                ],
              ),
            ),
            Builder(builder: (context) {
              if (controls is CartControl) {
                return Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<CartNotifier>()
                            .removeWholeProductFromCart(controls.productID);
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: Colors.black),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ));
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

  final List<Color> colors = const [
    Color.fromARGB(255, 207, 207, 246),
    Color.fromARGB(255, 248, 215, 246),
    Color.fromARGB(255, 250, 215, 218),
    Color.fromARGB(255, 208, 246, 207),
  ];
}
