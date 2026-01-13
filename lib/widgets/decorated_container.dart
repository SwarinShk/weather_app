import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';

class DecoratedContainer extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double? width;

  final Widget child;

  const DecoratedContainer({
    this.color = AppColor.containerColor,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.all(15),
    this.width,

    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: child,
    );
  }
}
