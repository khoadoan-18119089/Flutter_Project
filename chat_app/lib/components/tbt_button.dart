
import 'package:chat_app/common/enums/enum.dart';
import 'package:wow_views/common/color.dart';
import 'package:wow_views/common/text_style.dart';
import 'package:wow_views/components/wow_text.dart';
import 'package:flutter/material.dart';

class TBTButton extends StatelessWidget {
  static const double _kDefaultHeight = 44;

  /// Loại nút
  final ButtonType _type;

  /// Chiều cao của nút
  final double? height;

  /// Chiều dài của nút
  final double? width;

  /// Kích thước nút
  final double? size;

  /// Độ cao của nút
  final double? elevation;

  /// Khoảng cách giữa các Widget trong nút
  final double? spacing;

  /// Nội dung nút
  final String? text;

  /// Màu chủ đạo nút
  final Color? primaryColor;

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

  /// Kiểu chữ của nội dung nút
  final TextStyle? textStyle;

  /// Màu chữ
  final Color? textColor;

  /// Kích thước
  final double? fontSize;

  /// Độ đậm chữ
  final FontWeight? fontWeight;

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

  /// minSize cua icon buton
  final double? minSize;

  final bool disable;

  final bool? isExpand;

  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  final FlexFit? fit;

  const TBTButton.elevated({
    super.key,
    this.height = _kDefaultHeight,
    this.width,
    this.elevation,
    this.text,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.textStyle,
    required this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.spacing,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = ButtonType.elevated,
        primaryColor = null,
        borderWidth = null,
        icon = null,
        size = null,
        minSize = null;

  const TBTButton.outlined({
    super.key,
    this.height = _kDefaultHeight,
    this.width,
    this.text,
    this.primaryColor,
    this.backgroundColor,
    this.borderRadius,
    this.borderWidth = 1,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.textStyle,
    required this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.spacing,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = ButtonType.outlined,
        elevation = null,
        icon = null,
        size = null,
        minSize = null;

  const TBTButton.text({
    super.key,
    this.height,
    this.width,
    this.spacing,
    this.text,
    this.primaryColor,
    this.margin,
    this.padding,
    this.textStyle,
    this.textColor,
    this.fontSize,
    required this.onPressed,
    this.onLongPress,
    this.prefixIcon,
    this.mid,
    this.suffixIcon,
    this.fontWeight,
    this.isExpand = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.fit,
    this.disable = false,
  })  : _type = ButtonType.text,
        backgroundColor = null,
        borderRadius = null,
        borderWidth = null,
        elevation = null,
        icon = null,
        size = null,
        minSize = null;

  const TBTButton.icon({
    super.key,
    required this.icon,
    this.size = 24,
    this.margin,
    this.padding,
    required this.onPressed,
    this.minSize = kMinInteractiveDimension,
    this.disable = false,
  })  : _type = ButtonType.icon,
        height = null,
        width = null,
        backgroundColor = null,
        borderRadius = null,
        borderWidth = null,
        elevation = null,
        spacing = null,
        text = null,
        primaryColor = null,
        textStyle = null,
        textColor = null,
        fontSize = null,
        fontWeight = null,
        mid = null,
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
      width: width,
      margin: margin,
      child: _button(),
    );
  }

  Widget _button() {
    switch (_type) {
      case ButtonType.elevated:
        return _elevatedButton();
      case ButtonType.outlined:
        return _outlinedButton();
      case ButtonType.text:
        return _text();
      case ButtonType.icon:
        return _icon();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor ?? TBTColor.pink4667,
        elevation: elevation ?? 0,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
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
            child: mid ??
                WowText(
                  text,
                  style: textStyle ??
                      WowTextStyle.button.copyWith(
                        color: textColor ?? TBTColor.whiteFFFF,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                ),
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: spacing),
            suffixIcon!,
          ],
        ],
      ),
    );
  }

  Widget _outlinedButton() {
    return OutlinedButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: OutlinedButton.styleFrom(
        primary: primaryColor ?? TBTColor.pink4667,
        backgroundColor: backgroundColor ?? Colors.transparent,
        padding: padding,
        side: BorderSide(
          color: primaryColor ?? TBTColor.pink4667,
          width: borderWidth!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(0, 0),
      ),
      child: Row(
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
            child: mid ??
                WowText(
                  text,
                  style: textStyle ??
                      WowTextStyle.button.copyWith(
                        color: textColor ?? primaryColor ?? TBTColor.pink4667,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                ),
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: spacing),
            suffixIcon!,
          ],
        ],
      ),
    );
  }

  Widget _text() {
    return TextButton(
      onPressed: disable ? null : onPressed,
      onLongPress: disable ? null : onLongPress,
      style: TextButton.styleFrom(
        padding: padding ?? const EdgeInsets.all(0),
        primary: primaryColor ?? TBTColor.pink4667,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
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
            child: mid ??
                WowText(
                  text,
                  style: textStyle ??
                      WowTextStyle.button.copyWith(
                        color: textColor ?? primaryColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                      ),
                ),
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: spacing),
            suffixIcon!,
          ],
        ],
      ),
    );
  }

  Widget _icon() {
    return IconButton(
      padding: padding ?? const EdgeInsets.all(0),
      splashRadius: size! * 0.6,
      iconSize: size,
      constraints: BoxConstraints(
        minWidth: minSize!,
        minHeight: minSize!,
      ),
      icon: SizedBox(
        height: size,
        width: size,
        child: Center(
          child: IconTheme.merge(
            data: IconThemeData(size: size),
            child: icon!,
          ),
        ),
      ),
      onPressed: disable ? null : onPressed,
    );
  }
}
