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
    this.icon,
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
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius:
              isLarge ? BorderRadius.circular(20) : BorderRadius.circular(500),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              offset: Offset(-2, 2),
            ),
          ],
        ),
        margin: margin,
        width: width ?? 20,
        height: height ?? 20,
        child: Material(
          clipBehavior: Clip.antiAlias,
          shape: isLarge ? const StadiumBorder() : const CircleBorder(),
          color: color,
          child: InkWell(
            splashColor: color.withOpacity(0.1),
            onTap: onTap,
            child: icon == null ? Container() : Image.asset(icon!),
          ),
        ),
      ),
    );
  }
}
