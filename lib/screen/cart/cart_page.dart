import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/models/models.dart';
import 'package:onlineshop/widget/cart/cart_card.dart';

import '../../widget/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartbox = Hive.box('cart_box');

    final products = cartbox.values.map(
      (e) {
        return Map<String, dynamic>.from(e);
      },
    ).toList();

    if (kDebugMode) {
      print(products);
    }

    var cart = products.reversed.toList();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gaph36,
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
              gaph20,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //final data = cart[index];
                    return ProductCardList(
                        controls: CartControl(
                            product: Product.fromJson(cart[index]),
                            productQuantity: cart[index]['qty']));
                  },
                ),
              ),
            ],
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
      ),
    );
  }
}
