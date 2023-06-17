import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:onlineshop/screen/products/product_details.dart';
import '../../models/models.dart';
import '../widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 10, bottom: 8),
      child: ShadowWidget(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(product: product),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .23,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(product.imageUrl[0])),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: context
                                  .read<WishlistNotifier>()
                                  .wishlistProducts
                                  .containsKey(product.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: Sizes.p36,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: Sizes.p36,
                                ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWidget(
                              label: product.name,
                              size: Sizes.p28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontHeight: 1.1,
                            ),
                            LabelWidget(
                              label: product.category,
                              size: Sizes.p18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontHeight: 1.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$ ${product.price}',
                                  style: const TextStyle(
                                      fontSize: Sizes.p28,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Colors',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Sizes.p18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    GapWidth.gapw4,
                                    ChoiceChip(
                                      label: const Text(" "),
                                      selected: selected,
                                      visualDensity: VisualDensity.compact,
                                      selectedColor: Colors.black,
                                    )
                                  ],
                                )
                              ],
                            )
                          ]),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
