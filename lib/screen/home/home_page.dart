import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import '../../config/constant/constants.dart';
import '../../provider/providers.dart';
import '../../widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                          GapHeight.gaph12,
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
                  child: Consumer<DataProvider>(
                    builder: (context, data, child) {
                      if (data.femaleShoes.isLoaded &&
                          data.maleShoes.isLoaded &&
                          data.kidsShoes.isLoaded) {
                        return TabBarView(
                          children: [
                            ShoesData(
                                data: data.maleShoes.products, tapIndex: 0),
                            ShoesData(
                                data: data.femaleShoes.products, tapIndex: 1),
                            ShoesData(
                                data: data.kidsShoes.products, tapIndex: 2),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
