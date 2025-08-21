import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final InputBorder? border;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets? padding;
  final Color? fillColor;
  final bool? filled;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.enabled = true,
    this.border,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.maxLines = 1,
    this.maxLength,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    this.fillColor,
    this.filled = false,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          border: border ?? const OutlineInputBorder(),
          enabledBorder: border ?? const OutlineInputBorder(),
          focusedBorder: border ?? const OutlineInputBorder(),
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          fillColor: fillColor,
          filled: filled,
        ),
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        validator: validator,
        enabled: enabled,
        style: textStyle,
        maxLines: maxLines,
        maxLength: maxLength,
        focusNode: focusNode,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
      ),
    );
  }
}