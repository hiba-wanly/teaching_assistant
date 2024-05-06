import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class TRounedContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const TRounedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = TSize.cardRadiuslg,
      this.child,
      this.showBorder = false,
      this.borderColor = const Color(0xfff9f8f7),
      this.backgroundColor = kButtonColor,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
