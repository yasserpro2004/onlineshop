import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:onlineshop/widget/cart/cart_card.dart';

import '../../widget/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartNotifier>(
        builder: (context, cartNotifier, child) {
          if (!cartNotifier.isDataLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GapHeight.gaph36,
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                    const LabelWidget(
                        label: 'My Cart',
                        size: Sizes.p36,
                        fontWeight: FontWeight.bold),
                    GapHeight.gaph20,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cartNotifier.cartProducts.length,
                        itemBuilder: (context, index) {
                          final data =
                              cartNotifier.cartProducts.values.toList();
                          return ProductCardList(
                              name: data[index].name,
                              category: data[index].category,
                              imageUrl: data[index].imageURL,
                              sizes: data[index].sizes,
                              price: data[index].price,
                              controls: CartControl(
                                  productID: data[index].id,
                                  productQuantity: data[index].qty));
                        },
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CartSammary(
                      total: cartNotifier.totalPriceString,
                      delivery: cartNotifier.deliveryFeeString,
                      net: cartNotifier.netValueString),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    backgroundColor: Colors.black,
                    forColor: Colors.white,
                    label: 'Proceed to Checkout',
                    width: MediaQuery.of(context).size.width * 0.95,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}


