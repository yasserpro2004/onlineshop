//import 'package:firebase_tutorial_one/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import '../widgets.dart';

//enum ProductControl { wishlist, cart }

class ProductCardList extends StatelessWidget {
  //final ProductModel product;
  final ProductsControl controls;

  const ProductCardList({Key? key, required this.controls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ShadowWidget(
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (context) {},
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ],
          ),
          child: Container(
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
                          controls.product.imageUrl[0],
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
                          label: controls.product.name,
                          size: Sizes.p16,
                          fontWeight: FontWeight.bold,
                        ),
                        LabelWidget(
                          label: controls.product.category,
                          size: Sizes.p14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabelWidget(
                              label: '\$ ${controls.product.price.toString()}',
                              size: Sizes.p16,
                              fontWeight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                const LabelWidget(
                                    label: 'Sizes',
                                    size: Sizes.p16,
                                    fontWeight: FontWeight.w600),
                                LabelWidget(
                                    label: controls.product.sizes.toString(),
                                    size: Sizes.p16,
                                    fontWeight: FontWeight.w600)
                              ],
                            )
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
