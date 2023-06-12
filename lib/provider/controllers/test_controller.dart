/* import 'package:flutter/material.dart';
import 'package:onlineshop/config/constant/app_sizes.dart';
import 'package:onlineshop/widget/shared/custom_label.dart';

enum Selection { multiSelection, singleSelection }

class MyCustomToggleSwitch extends StatelessWidget {
  final List<String> items;
  final ValueNotifier<List<int>> selectedButtons;
  final Selection selection;
  List<String> _selectedShoesSizes = [];

  MyCustomToggleSwitch({
    Key? key,
    required this.items,
    required this.selectedButtons,
    this.selection = Selection.singleSelection,
    //required this.selectedShoesSizes
  }) : super(key: key);

  factory MyCustomToggleSwitch.withDefault({
    Key? key,
    required List<String> items,
    Selection selection = Selection.singleSelection,
    // required List<String> selectedShoesSizes
  }) {
    return MyCustomToggleSwitch(
      key: key,
      items: items,
      selectedButtons: ValueNotifier<List<int>>(
          selection == Selection.multiSelection ? [] : [0]),
      selection: selection, // selectedShoesSizes: selectedShoesSizes,
    );
  }

  List<String> get selectedShoesSizes => _selectedShoesSizes;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<int>>(
      valueListenable: selectedButtons,
      builder: (context, indices, child) {
        return ToggleButtons(
          //verticalDirection: ,
          borderColor: Colors.transparent,
          isSelected: items
              .map((item) => indices.contains(items.indexOf(item)))
              .toList(),
          onPressed: (newIndex) {
            if (selection == Selection.singleSelection) {
              selectedButtons.value = [newIndex];
              _selectedShoesSizes = [items[newIndex]];
            } else {
              if (indices.contains(newIndex)) {
                indices.remove(newIndex);
                _selectedShoesSizes.remove(items[newIndex]);
              } else {
                indices.add(newIndex);
                _selectedShoesSizes.add(items[newIndex]);
              }
              selectedButtons.value = List<int>.from(indices);
            }
          },
          children: items
              .map((item) => _CustomToggleButtonItem(
                  item: item,
                  selected: ValueNotifier<bool>(
                      indices.contains(items.indexOf(item)))))
              .toList(),
        );
      },
    );
  }
}

class _CustomToggleButtonItem extends StatelessWidget {
  final String item;
  final ValueNotifier<bool> selected;

  const _CustomToggleButtonItem({
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
 */