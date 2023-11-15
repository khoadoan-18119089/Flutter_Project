import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class CustomButton extends StatelessWidget {
  static const double _kDefaultHeight = 38;

  /// Loại nút
  final TypeButton _type;

  /// Chiều cao của nút
  final double? height;

  /// Độ cao của nút
  final double? elevation;

  /// Khoảng cách giữa các Widget trong nút
  final double? spacing;

  /// Nội dung nút
  final String? text;

  /// Màu chủ đạo nút
  final Color? foregroundColor;

  /// Màu nền nút
  final Color? backgroundColor;

  /// Bo tròn nút
  final BorderRadius? borderRadius;

  /// Độ dày viền
  final double? borderWidth;

  /// Khoảng cách nút so với Widget parent
  final EdgeInsets? margin;

  /// Khoảng cách Widget child so với nút
  final EdgeInsets? padding;

  /// Màu chữ
  final Color? textColor;

  /// Khi ấn nút
  final void Function()? onPressed;

  /// Khi giữ nút
  final void Function()? onLongPress;

  /// Icon tiền tố
  final Widget? prefixIcon;

  /// widget mid
  final Widget? mid;

  /// Icon hậu tố
  final Widget? suffixIcon;

  /// Icon
  final Widget? icon;

  final bool disable;

  final bool? isExpand;

  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

  final FlexFit? fit;

  const CustomButton.elevated({
    super.key,
    this.height = _kDefaultHeight,
    this.elevation,
    this.text,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    required this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.spacing,
    this.textColor,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = TypeButton.elevated,
        foregroundColor = null,
        borderWidth = null,
        icon = null;

  const CustomButton.outlined({
    super.key,
    this.height = _kDefaultHeight,
    this.text,
    this.foregroundColor,
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth = 1,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    required this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.spacing,
    this.textColor,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = TypeButton.outlined,
        elevation = null,
        icon = null;

  const CustomButton.text({
    super.key,
    this.height,
    this.spacing,
    this.text,
    this.foregroundColor,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    this.textColor,
    this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = TypeButton.text,
        backgroundColor = null,
        borderRadius = null,
        borderWidth = null,
        elevation = null,
        icon = null;

  const CustomButton.icon({
    super.key,
    required this.icon,
    this.text,
    this.mid,
    this.textColor,
    this.margin,
    this.padding,
    required this.onPressed,
    this.disable = false,
  })  : _type = TypeButton.icon,
        height = null,
        backgroundColor = null,
        borderRadius = null,
        borderWidth = null,
        elevation = null,
        spacing = null,
        foregroundColor = null,
        prefixIcon = null,
        suffixIcon = null,
        isExpand = null,
        onLongPress = null,
        mainAxisAlignment = null,
        crossAxisAlignment = null,
        fit = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: Opacity(
        opacity: disable ? 0.5 : 1,
        child: _button(),
      ),
    );
  }

  Widget _button() {
    switch (_type) {
      case TypeButton.outlined:
        return _outlinedButton();
      case TypeButton.elevated:
        return _elevatedButton();
      case TypeButton.text:
        return _text();
      case TypeButton.icon:
        return _icon();
    }
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation ?? 0,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      ),
      child: _component(),
    );
  }

  Widget _outlinedButton() {
    return OutlinedButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor ?? Colors.transparent,
        padding: padding,
        side: BorderSide(
          color:
              disable ? Colors.grey.shade500 : foregroundColor ?? Colors.white,
          width: borderWidth!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      ),
      child: _component(),
    );
  }

  Widget _text() {
    return TextButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        padding: padding ?? EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _component(),
    );
  }

  Widget _component() {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: isExpand! ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          SizedBox(width: spacing),
        ],
        Flexible(
          fit: fit ?? FlexFit.loose,
          child: mid ?? CustomText.bodyMedium(text!, color: textColor),
        ),
        if (suffixIcon != null) ...[
          SizedBox(width: spacing),
          suffixIcon!,
        ],
      ],
    );
  }

  Widget _icon() {
    return IconButton(
      padding: padding ?? EdgeInsets.zero,
      icon: Column(
        children: [
          icon!,
          if ((text != null && text!.isNotEmpty) || mid != null) ...[
            SizedBox(height: spacing),
            mid ??
                CustomText.bodyMedium(
                  text!,
                  color: textColor,
                ),
          ],
        ],
      ),
      onPressed: disable ? null : onPressed,
    );
  }
}
