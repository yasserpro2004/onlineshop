import 'package:flutter/material.dart';

import '../../config/constant/app_sizes.dart';
import '../widgets.dart';

class ShoesSizeToggleButton extends StatelessWidget {
  final String item;
  final ValueNotifier<bool> selected;

  const ShoesSizeToggleButton({
    Key? key,
    required this.item,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: selected,
      builder: (context, isSelected, child) {
        return Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: isSelected ? Colors.black : Colors.grey,
            ),
            child: LabelWidget(
              label: item,
              color: isSelected ? Colors.white : Colors.black,
              size: Sizes.p16,
              fontWeight: FontWeight.normal,
            ));
      },
    );
  }
}

