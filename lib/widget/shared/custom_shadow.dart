import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  const ShadowWidget({
    super.key,
    required this.child,
    this.borderRadius =15
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: Colors.transparent,
      shadowColor: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}
