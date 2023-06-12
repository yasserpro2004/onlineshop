import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    this.indicatorSize,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.isScrollable = false,
    required this.tabs,
  });
  final TabBarIndicatorSize? indicatorSize;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final bool isScrollable;
  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: indicatorSize,
        indicatorColor: indicatorColor,
        isScrollable: isScrollable,
        labelColor: labelColor,
        labelStyle: labelStyle,
        unselectedLabelColor: unselectedLabelColor,
        tabs: tabs.map((element) => Text(element)).toList());
  }
}
