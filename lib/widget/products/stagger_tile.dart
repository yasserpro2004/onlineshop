import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StaggerTile extends StatelessWidget {
  const StaggerTile({super.key, required this.product, required this.height});
  final Product product;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Sizes.p16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: product.imageUrl[0],
              fit: BoxFit.fitWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: Sizes.p20, fontWeight: FontWeight.w700),
                ),
                Text('\$ ${product.price}',
                    style: const TextStyle(
                        fontSize: Sizes.p20, fontWeight: FontWeight.w500))
              ],
            )
          ],
        ),
      ),
    );
  }
}
