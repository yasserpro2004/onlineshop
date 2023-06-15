import 'package:flutter/material.dart';

import '../../config/constant/app_sizes.dart';
import '../widgets.dart';

class CartSammary extends StatelessWidget {
  final String total;
  final String delivery;
  final String net;

  const CartSammary(
      {super.key,
      required this.total,
      required this.delivery,
      required this.net});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * .17,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade300,
        child: Column(
          children: [
            const Divider(
              thickness: 2,
              height: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(
                    label: 'Total',
                    size: Sizes.p16,
                    fontWeight: FontWeight.w500),
                LabelWidget(
                    label: total, size: Sizes.p16, fontWeight: FontWeight.w500)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(
                    label: 'Delivery',
                    size: Sizes.p16,
                    fontWeight: FontWeight.w500),
                LabelWidget(
                    label: delivery,
                    size: Sizes.p16,
                    fontWeight: FontWeight.w500)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LabelWidget(
                    label: 'Net', size: Sizes.p16, fontWeight: FontWeight.w500),
                LabelWidget(
                    label: net, size: Sizes.p16, fontWeight: FontWeight.w500)
              ],
            ),
          ],
        ),
      ),
    );
  }
}