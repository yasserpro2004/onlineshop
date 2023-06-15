import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/provider/providers.dart';
import '../../widget/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WishlistNotifier>(
        builder: (context, wishlistNotifier, child) {
          if (!wishlistNotifier.isDataLoaded) {
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
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: LabelWidget(
                          label: 'My Wishlist',
                          size: Sizes.p36,
                          fontWeight: FontWeight.bold),
                    ),
                    GapHeight.gaph20,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: wishlistNotifier.wishlistProducts.length,
                        itemBuilder: (context, index) {
                          final data =
                              wishlistNotifier.wishlistProducts.values.toList();
                          return ProductCardList(
                              name: data[index].name,
                              category: data[index].category,
                              imageUrl: data[index].imageURL,
                              sizes: const [],
                              price: data[index].price,
                              controls: WishlistControl(
                                  productID: data[index].productID));
                        },
                      ),
                    )
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
