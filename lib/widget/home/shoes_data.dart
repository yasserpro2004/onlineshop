import 'package:flutter/material.dart';
import 'package:onlineshop/screen/products/product_by_cat.dart';
import 'package:onlineshop/widget/widgets.dart';
import '../../models/models.dart';
import '../../config/constant/app_sizes.dart';
import '../../config/constant/constants.dart';

class ShoesData extends StatelessWidget {
  final List<Product> data;
  final int tapIndex;
  const ShoesData({super.key, required this.data, required this.tapIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Sizes.p4),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.41,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: Sizes.p12),
                    child: ProductCard(product: data[index]));
              },
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: appStyle(Sizes.p24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsByCategory(
                              tapIndex: tapIndex,
                            ),
                          ));
                    },
                    child: Row(children: [
                      Text(
                        'show All',
                        style:
                            appStyle(Sizes.p20, Colors.black, FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_right_outlined,
                        size: Sizes.p32,
                      )
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return NewShoes(
                    imageUrl: data[index].imageUrl[0],
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
