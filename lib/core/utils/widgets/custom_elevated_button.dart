import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final IconData? icon;
  final bool? enabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Size? minimumSize;
  final Size? maximumSize;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.style,
    this.icon,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.borderRadius,
    this.minimumSize,
    this.maximumSize,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = style ?? ButtonStyle(
      backgroundColor: backgroundColor != null
          ? WidgetStateProperty.all(backgroundColor)
          : null,
      foregroundColor: foregroundColor != null
          ? WidgetStateProperty.all(foregroundColor)
          : null,
      elevation: elevation != null
          ? WidgetStateProperty.all(elevation)
          : null,
      padding: padding != null
          ? WidgetStateProperty.all(padding)
          : null,
      shape: borderRadius != null
          ? WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: borderRadius!),
      )
          : null,
      minimumSize: minimumSize != null
          ? WidgetStateProperty.all(minimumSize)
          : null,
      maximumSize: maximumSize != null
          ? WidgetStateProperty.all(maximumSize)
          : null,
      textStyle: textStyle != null
          ? WidgetStateProperty.all(textStyle)
          : null,
    );

    return Container(
      margin: margin,
      child: icon != null
          ? ElevatedButton.icon(
        onPressed: enabled == true ? onPressed : null,
        style: buttonStyle,
        icon: Icon(icon),
        label: child ?? const SizedBox.shrink(),
      )
          : ElevatedButton(
        onPressed: enabled == true ? onPressed : null,
        style: buttonStyle,
        child: child,
      ),
    );
  }
}