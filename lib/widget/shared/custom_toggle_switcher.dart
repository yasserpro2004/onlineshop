import 'package:flutter/material.dart';

enum Selection { multiSelection, singleSelection }

class CustomToggleSwitch extends StatelessWidget {
  final List<String> items;
  final ValueNotifier<List<int>> selectedButtons;
  final Selection selection;
  final Widget Function(
      {required String item,
      required ValueNotifier<bool> selected}) createToggleButton;

  final List<String> _selectedShoesSizes ;

  CustomToggleSwitch(
      {Key? key,
      required this.items,
      required this.selectedButtons,
      this.selection = Selection.singleSelection,
      required this.createToggleButton})
      :_selectedShoesSizes =[], super(key: key);

  factory CustomToggleSwitch.withDefault(
      {Key? key,
      required List<String> items,
      Selection selection = Selection.singleSelection,
      required Widget Function(
              {required String item, required ValueNotifier<bool> selected})
          createToggleButton}) {
    return CustomToggleSwitch(
      key: key,
      items: items,
      selectedButtons: ValueNotifier<List<int>>(
          selection == Selection.multiSelection ? [] : [0]),
      selection: selection,
      createToggleButton: createToggleButton,
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
              _selectedShoesSizes.clear();
              _selectedShoesSizes.add(items[newIndex]);
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
              .map((item) => createToggleButton(
                  item: item,
                  selected: ValueNotifier<bool>(
                      indices.contains(items.indexOf(item)))))
              .toList(),
        );
      },
    );
  }
}
