import 'package:flutter/material.dart';

class EncircleText extends StatelessWidget {
  const EncircleText({
    Key? key,
    required this.text,
    Color? bgc,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxShape? shape,
  })  : width = width ?? 25,
        height = height ?? 25,
        margin = margin ?? EdgeInsets.zero,
        padding = padding ?? const EdgeInsets.all(0),
        shape = shape ?? BoxShape.circle,
        bgc = bgc ?? Colors.amber,
        super(key: key);

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxShape shape;
  final Color bgc;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgc,
        shape: shape,
      ),
      child: text,
    );
  }
}
