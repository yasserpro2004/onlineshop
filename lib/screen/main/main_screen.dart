import 'package:flutter/material.dart';
import 'package:onlineshop/provider/providers.dart';
import '../../config/constant/app_style.dart';
import '../screens.dart';
import 'package:provider/provider.dart';
import '../../widget/widgets.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // int pageIndex = 1;
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          backgroundColor: appBackgroundColor,
          body: pageList[mainScreenNotifier.pageIndex],
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
