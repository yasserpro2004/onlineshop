import 'package:flutter/material.dart';

import '../../config/constant/constants.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final double? fontHeight;
  const LabelWidget({
    super.key,
    required this.label,
    required this.size,
    this.color = Colors.black,
    required this.fontWeight,
    this.fontHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      //'Athletics Shoes',
      label,
      //style: appStyle(Sizes.p28, Colors.black45, FontWeight.bold, fh: 1.2),
      style: appStyle(size, color, fontWeight, fh: fontHeight),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
