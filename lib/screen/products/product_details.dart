import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop/provider/providers.dart';
import 'package:provider/provider.dart';

import '../../config/constant/app_sizes.dart';
import '../../models/models.dart';
import '../../widget/widgets.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final mycustomToggleSwitch = CustomToggleSwitch.withDefault(
      items: product.sizes.map((e) => e['size'].toString()).toList(),
      selection: Selection.multiSelection,
      createToggleButton: (
              {required String item, required ValueNotifier<bool> selected}) =>
          ShoesSizeToggleButton(item: item, selected: selected),
    );

    final cartBox = Hive.box('cart_box');

    Future<void> createCart(Map<String, dynamic> newProductCart) async {
     /*  final cartBox = Hive.box('cart_box');
      final productId = newProductCart['id'];

      if (cartBox.containsKey(productId)) {
        // If the product is already in the cart, update its quantity
        final currentProduct = cartBox.get(productId) as Map<String, dynamic>;
        final currentQty = currentProduct['qty'] as int;
        cartBox.put(productId, {...currentProduct, 'qty': currentQty + 1});
      } else {
        // If the product is not in the cart, add it with a quantity of 1
        cartBox.put(productId, {...newProductCart, 'qty': 1});
      } */

      await cartBox.add(newProductCart);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavBarIcon(
                      ico: Icons.close,
                      iconColor: Colors.black,
                      onTap: () {
                        context.read<PageIndicator>().reset();
                        Navigator.of(context).pop();
                      },
                    ),
                    NavBarIcon(
                      ico: Icons.more_horiz,
                      iconColor: Colors.black,
                      onTap: () {
                        //Navigator.of(context).pop();
                      },
                    )
                  ]),
            ),
            pinned: true,
            snap: false,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.39,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade300,
                          child: PageView.builder(
                            itemCount: product.imageUrl.length,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (pageIndex) {
                              context.read<PageIndicator>().pageIndex =
                                  pageIndex;
                            },
                            itemBuilder: (context, index) {
                              return CachedNetworkImage(
                                imageUrl: product.imageUrl[index],
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: Sizes.p16,
                          top: MediaQuery.of(context).size.height * 0.08,
                          child: const NavBarIcon(
                            ico: Icons.favorite_border,
                            iconColor: Colors.grey,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: MediaQuery.of(context).size.height * 0.33,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                product.imageUrl.length,
                                (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Consumer<PageIndicator>(
                                      builder: (context, pageIndicator, child) {
                                        return CircleAvatar(
                                          radius: 5,
                                          backgroundColor:
                                              pageIndicator.pageIndex != index
                                                  ? Colors.grey
                                                  : Colors.black,
                                        );
                                      },
                                    )),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.665,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelWidget(
                                label: product.name,
                                size: Sizes.p32,
                                fontWeight: FontWeight.bold),
                            LabelWidget(
                              label: product.category,
                              size: Sizes.p16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            gaph16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LabelWidget(
                                    label: '\$${product.price}',
                                    size: Sizes.p24,
                                    fontWeight: FontWeight.w600),
                                Row(
                                  children: const [
                                    LabelWidget(
                                      label: 'Colors',
                                      size: Sizes.p16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                    gapw4,
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 5,
                                    ),
                                    gapw4,
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 5,
                                    )
                                  ],
                                )
                              ],
                            ),
                            gaph12,
                            Row(
                              children: const [
                                LabelWidget(
                                    label: 'Select a sizes',
                                    size: Sizes.p16,
                                    fontWeight: FontWeight.w600),
                                gapw16,
                                LabelWidget(
                                  label: 'View size guide',
                                  size: Sizes.p16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            gaph12,
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: /*  MyCustomToggleSwitch.withDefault(
                                      selection: Selection.multiSelection,
                                      items: shoesSizes), */
                                    mycustomToggleSwitch,
                              ),
                            ),
                            gaph12,
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            LabelWidget(
                                label: product.title,
                                size: Sizes.p24,
                                fontWeight: FontWeight.w700),
                            LabelWidget(
                                label: product.description,
                                size: Sizes.p16,
                                fontWeight: FontWeight.normal),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: CustomButton(
                                  backgroundColor: Colors.black,
                                  forColor: Colors.white,
                                  label: 'Add to Cart',
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  onTap: () async {
                                    createCart({
                                      "id": product.id,
                                      "name": product.name,
                                      "category": product.category,
                                      "sizes": mycustomToggleSwitch
                                          .selectedShoesSizes,
                                      "imageUrl": product.imageUrl,
                                      "price": product.price,
                                      "qty": 1
                                    });
                                    Navigator.of(context).pop();
                                    if (kDebugMode) {
                                      print(mycustomToggleSwitch
                                          .selectedShoesSizes);
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
