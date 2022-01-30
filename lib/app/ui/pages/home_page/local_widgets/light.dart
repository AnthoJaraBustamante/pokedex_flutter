import 'package:flutter/material.dart';

class Light extends StatelessWidget {
  const Light({
    Key? key,
    this.width,
    this.height,
    required this.color,
    this.margin,
    this.onTap,
    this.isLarge = false,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final bool isLarge;
  final void Function()? onTap;
  final void Function()? onTapCancel;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onTapUp: onTapUp,
      child: Container(
        margin: margin,
        width: width ?? 20,
        height: height ?? 20,
        decoration: BoxDecoration(
          color: color,
          shape: isLarge ? BoxShape.rectangle : BoxShape.circle,
          border: Border.all(
            width: 3,
          ),
          borderRadius: isLarge ? BorderRadius.circular(20) : null,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              offset: Offset(-2, 2),
            ),
          ],
        ),
      ),
    );
  }
}
