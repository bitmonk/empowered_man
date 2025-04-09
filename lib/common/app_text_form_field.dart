import 'dart:math' as math;

import 'package:empowered/core/extension/extensions.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.decoration,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.onTap,
    this.isReadOnly = false,
    this.scroll = EdgeInsets.zero,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.labelText,
    this.fillColor = AppColors.bgDark,
    this.borderWidth = 1.0,
    this.hintStyle,
    this.autofillHints,
    this.focusedBorderColor = AppColors.neutral50,
    this.style,
    this.cursorHeight,
    this.maxLength,
    this.alignLabelWithHint = false,
    this.onChanged,
    this.borderSide = const BorderSide(
      color: AppColors.textColor100,
    ),
    this.enabledBorderSide = const BorderSide(
      color: AppColors.textColor200,
    ),
    this.focusNode,
    this.initialValue,
  });
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isReadOnly;
  final void Function()? onTap;
  final EdgeInsets scroll;
  final AutovalidateMode autovalidateMode;
  final TextInputAction textInputAction;
  final BorderRadius borderRadius;

  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final String? labelText;
  final BorderSide borderSide;
  final BorderSide enabledBorderSide;

  final Color fillColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Iterable<String>? autofillHints;
  final double? cursorHeight;
  final int? maxLength;
  final bool alignLabelWithHint;
  final void Function(String)? onChanged;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      maxLines: maxLines,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      scrollPadding: scroll,
      readOnly: isReadOnly,
      onTap: () {
        onTap?.call();
      },
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      minLines: minLines,
      keyboardType: textInputType,
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      cursorHeight: cursorHeight,
      style: AppTextStyles.titleMd.copyWith(fontWeight: FontWeight.w400),
      buildCounter: maxLength == null
          ? null
          : (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return Text(
                '$currentLength/$maxLength words',
                style: const TextStyle(
                  color: AppColors.textColor50,
                  fontSize: 16,
                ),
              );
            },
      inputFormatters: maxLength != null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : [],
      decoration: InputDecoration(
        counterText: '',
        // suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText,
        labelStyle: AppTextStyles.titleSm.copyWith(
          color: AppColors.textColor100,
          fontSize: 16,
        ),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        alignLabelWithHint: alignLabelWithHint,
        hintStyle: hintStyle ??
            AppTextStyles.titleMd.copyWith(
              color: AppColors.textColor50,
              fontWeight: FontWeight.w400,
            ),
        contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: enabledBorderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: borderSide,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: AppColors.textColor100,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(color: AppColors.appRed),
        ),
        errorStyle: const TextStyle(
          color: AppColors.colorRed,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 36,
          minWidth: 40,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon == null
            ? null
            : Focus(
                canRequestFocus: false,
                descendantsAreFocusable: false,
                child: suffixIcon!,
              ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          minWidth: 24,
        ),
      ),
    );
  }
}

class CustomOutlineInputBorder extends InputBorder {
  /// Creates an underline border for an [InputDecorator].
  ///
  /// The [borderSide] parameter defaults to [BorderSide.none] (it must not be
  /// null). Applications typically do not specify a [borderSide] parameter
  /// because the input decorator substitutes its own, using [copyWith], based
  /// on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where the top left
  /// and right corners have a circular radius of 4.0. The [borderRadius]
  /// parameter must not be null.
  const CustomOutlineInputBorder({
    super.borderSide = const BorderSide(),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomLeft: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
  });

  /// The radii of the border's rounded rectangle corners.
  ///
  /// When this border is used with a filled input decorator, see
  /// [InputDecoration.filled], the border radius defines the shape
  /// of the background fill as well as the bottom left and right
  /// edges of the underline itself.
  ///
  /// By default the top right and top left corners have a circular radius
  /// of 4.0.
  final BorderRadius borderRadius;

  @override
  bool get isOutline => false;

  @override
  CustomOutlineInputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) {
    return CustomOutlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.only(bottom: borderSide.width);
  }

  @override
  CustomOutlineInputBorder scale(double t) {
    return CustomOutlineInputBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRect(
        Rect.fromLTWH(
          rect.left,
          rect.top,
          rect.width,
          math.max(0, rect.height - borderSide.width),
        ),
      );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomOutlineInputBorder) {
      return CustomOutlineInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomOutlineInputBorder) {
      return CustomOutlineInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  /// Draw a horizontal line at the bottom of [rect].
  ///
  /// The [borderSide] defines the line's color and weight. The `textDirection`
  /// `gap` and `textDirection` parameters are ignored.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final paint = borderSide.toPaint();
    final outer = borderRadius.toRRect(rect);
    final center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is InputBorder && other.borderSide == borderSide;
  }

  @override
  int get hashCode => borderSide.hashCode;
}
