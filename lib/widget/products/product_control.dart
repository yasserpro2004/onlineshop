import 'package:flutter/material.dart';
import 'package:onlineshop/provider/providers.dart';

abstract class ProductsControl extends StatelessWidget {
  final String productID;

  const ProductsControl({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WishlistControl extends ProductsControl {
  const WishlistControl({super.key, required String productID})
      : super(productID: productID);

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
      {super.key, required String productID, required this.productQuantity})
      : super(productID: productID);

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
              onTap: () {
                context.read<CartNotifier>().incrementProductInCart(productID);
              },
              child: const Icon(Icons.add_circle_rounded),
            ),
            Text(
              ' $productQuantity ',
            ),
            InkWell(
              onTap: () {
                context.read<CartNotifier>().removeProductCart(productID);
              },
              child: const Icon(Icons.remove_circle_rounded),
            )
          ],
        ),
      ),
    );
  }
}
