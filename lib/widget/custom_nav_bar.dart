import 'package:flutter/material.dart';
import 'package:onlineshop/provider/providers.dart';
import 'widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Consumer<MainScreenNotifier>(
            builder: (context, mainScreenNotifier, child) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavBarIcon(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 0;
                      },
                      ico: mainScreenNotifier.pageIndex == 0
                          ? Ionicons.home
                          : Ionicons.home_outline,
                    ),
                    NavBarIcon(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 1;
                      },
                      ico: mainScreenNotifier.pageIndex == 1
                          ? Ionicons.search
                          : Ionicons.search_outline,
                    ),
                    NavBarIcon(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 2;
                      },
                      ico: mainScreenNotifier.pageIndex == 2
                          ? Ionicons.add_circle
                          : Ionicons.add_circle_outline,
                    ),
                    NavBarIcon(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 3;
                      },
                      ico: mainScreenNotifier.pageIndex == 3
                          ? Ionicons.cart
                          : Ionicons.cart_outline,
                    ),
                    NavBarIcon(
                      onTap: () {
                        mainScreenNotifier.pageIndex = 4;
                      },
                      ico: mainScreenNotifier.pageIndex == 4
                          ? Ionicons.person
                          : Ionicons.person_outline,
                    ),
                  ]);
            },
          )),
    );
  }
}
