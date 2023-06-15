import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/models/models.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:onlineshop/widget/widgets.dart';

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
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            final wishlistItem = WishlistItem()
              ..productID = productID
              ..name = ''
              ..category = ''
              ..imageURL = ''
              ..price = 0;
            context.read<WishlistNotifier>().updateData(wishlistItem, false);
          },
          child: const Icon(Icons.heart_broken,size: Sizes.p36,),
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
            LabelWidget(
                label: ' $productQuantity ',
                size: Sizes.p18,
                fontWeight: FontWeight.w600),
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
