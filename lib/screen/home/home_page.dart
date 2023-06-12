import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:provider/provider.dart';
import '../../config/constant/app_style.dart';
import '../../provider/providers.dart';
import '../../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: appBackgroundColor,
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
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LabelWidget(
                            label: 'Athletics Shoes',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: Sizes.p32,
                            fontHeight: 1.5,
                          ),
                          LabelWidget(
                              label: 'Collection',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: Sizes.p32,
                              fontHeight: 1.5),
                          gaph12,
                          CustomTabBar(
                            tabs: ['Men Shoes', 'Women Shoes', 'Kids Shoes'],
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white30,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.265),
                  child: TabBarView(
                    children: [
                      Consumer<MenShoesNotifier>(
                        builder: (context, menShoesNotifier, child) {
                          if (menShoesNotifier.menProducts.isEmpty) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return ShoesData(
                                data: menShoesNotifier.menProducts,
                                tapIndex: 0);
                          }
                        },
                      ),
                      Consumer<WomenShoesNotifier>(
                          builder: (context, womenShoesNotifier, child) {
                        if (womenShoesNotifier.womenProducts.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return ShoesData(
                              data: womenShoesNotifier.womenProducts,
                              tapIndex: 1);
                        }
                      }),
                      Consumer<KidsShoesNotifier>(
                          builder: (context, kidsShoesNotifier, child) {
                        if (kidsShoesNotifier.kidsProducts.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return ShoesData(
                              data: kidsShoesNotifier.kidsProducts,
                              tapIndex: 2);
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
