import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData ico;
  final Color iconColor;
  const NavBarIcon({
    super.key,
    required this.ico,
    this.onTap,
    this.iconColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          ico,
          color: iconColor,
        ),
      ),
    );
  }
}
