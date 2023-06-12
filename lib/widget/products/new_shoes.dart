import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/constant/app_sizes.dart';

class NewShoes extends StatelessWidget {
  final String imageUrl;
  const NewShoes({
    super.key,
    required this.imageUrl

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Sizes.p12, bottom: Sizes.p4),
      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        width: MediaQuery.of(context).size.width * 0.28,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 0.8,
              offset: Offset(1, 3),
            )
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: CachedNetworkImage(
            imageUrl:imageUrl,
               
            fit: BoxFit.fitWidth),
      ),
    );
  }
}