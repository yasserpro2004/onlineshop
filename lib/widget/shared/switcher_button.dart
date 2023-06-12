import 'package:flutter/material.dart';

class SwitcherButton extends StatelessWidget {
  const SwitcherButton(
      {super.key, this.onPressed, required this.btnColor, required this.lbl});
  final VoidCallback? onPressed;
  final Color btnColor;
  final String lbl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.255,
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: btnColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              lbl,
              style: TextStyle(
                  fontSize: 20, color: btnColor, fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
