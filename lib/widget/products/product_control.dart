import 'package:flutter/material.dart';
import '/../models/models.dart';

abstract class ProductsControl extends StatelessWidget {
  final Product product;

  const ProductsControl({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WishlistControl extends ProductsControl {
  const WishlistControl({super.key, required Product product})
      : super(product: product);

  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.add_circle_rounded),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}

class CartControl extends ProductsControl {
  const CartControl(
      {super.key, required Product product, required this.productQuantity})
      : super(product: product);

  final int productQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.add_circle_rounded),
            ),
            Text(
              ' $productQuantity ',
            ),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.remove_circle_rounded),
            )
          ],
        ),
      ),
    );
  }
}
