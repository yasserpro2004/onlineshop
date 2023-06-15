import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/config/constant/constants.dart';
import '../../widget/widgets.dart';
import '../../provider/providers.dart';

class ProductsByCategory extends StatelessWidget {
  final int tapIndex;
  const ProductsByCategory({super.key, required this.tapIndex});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tapIndex,
      length: 3,
      child: Scaffold(
          backgroundColor: AppColors.appBackgroundColor,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/top_image.png'),
                        fit: BoxFit.fitWidth),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NavBarIcon(
                              ico: Icons.close,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            NavBarIcon(
                              ico: Icons.tune,
                              onTap: () {
                                filter(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      GapHeight.gaph20,
                      const CustomTabBar(
                        tabs: ['Men Shoes', 'Women Shoes', 'Kids Shoes'],
                        isScrollable: true,
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white30,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: 15,
                      right: 15),
                  child: TabBarView(
                    children: [
                      Consumer<MenShoesNotifier>(
                        builder: (context, menShoesNotifier, child) {
                          if (menShoesNotifier.menProducts.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ProductsGrid(
                                data: menShoesNotifier.menProducts);
                          }
                        },
                      ),
                      Consumer<WomenShoesNotifier>(
                        builder: (context, womenShoesNotifier, child) {
                          if (womenShoesNotifier.womenProducts.isEmpty) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return ProductsGrid(
                                data: womenShoesNotifier.womenProducts);
                          }
                        },
                      ),
                      Consumer<KidsShoesNotifier>(
                        builder: (context, kidsShoesNotifier, child) {
                          if (kidsShoesNotifier.kidsProducts.isEmpty) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return ProductsGrid(
                                data: kidsShoesNotifier.kidsProducts);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

Future<dynamic> filter(BuildContext context) {
  double value = 100;
  List<String> brand = ['adidas.png', 'gucci.png', 'jordan.png', 'nike.png'];
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.white54,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(children: [
          GapHeight.gaph12,
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black45),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(children: [
              GapHeight.gaph24,
              const LabelWidget(
                  label: 'Filter',
                  size: Sizes.p40,
                  fontWeight: FontWeight.bold),
              GapHeight.gaph24,
              const LabelWidget(
                  label: 'Gender',
                  size: Sizes.p20,
                  fontWeight: FontWeight.bold),
              GapHeight.gaph20,
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SwitcherButton(lbl: 'Men', btnColor: Colors.black),
                    SwitcherButton(lbl: 'Women', btnColor: Colors.grey),
                    SwitcherButton(lbl: 'Kids', btnColor: Colors.grey),
                  ]),
              GapHeight.gaph24,
              const LabelWidget(
                  label: 'Category',
                  size: Sizes.p20,
                  fontWeight: FontWeight.w600),
              GapHeight.gaph20,
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SwitcherButton(lbl: 'Shoes', btnColor: Colors.black),
                    SwitcherButton(lbl: 'Appareles', btnColor: Colors.grey),
                    SwitcherButton(lbl: 'Accessories', btnColor: Colors.grey),
                  ]),
              GapHeight.gaph20,
              const LabelWidget(
                  label: 'Price', size: Sizes.p20, fontWeight: FontWeight.w600),
              Slider(
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                thumbColor: Colors.black,
                max: 500,
                divisions: 10,
                label: value.toString(),
                secondaryTrackValue: 200,
                value: value,
                onChanged: (value) {},
              ),
              GapHeight.gaph24,
              const LabelWidget(
                  label: 'Brand', size: Sizes.p20, fontWeight: FontWeight.w600),
              GapHeight.gaph20,
              Container(
                padding: const EdgeInsets.all(8),
                height: 80,
                child: ListView.builder(
                  itemCount: brand.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/${brand[index]}',
                          height: 60,
                          width: 75,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              )
            ]),
          )
        ]),
      );
    },
  );
}
