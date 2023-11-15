import 'package:flutter/material.dart';
import 'package:youtube_clone/common/enum.dart';

class CustomText extends StatelessWidget {
  /// Giống text của Material
  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        _type = TypeText.value,
        color = null,
        fontWeight = null;

  /// Giống text.rich của Material
  const CustomText.rich(
    InlineSpan textSpan, {
    super.key,
    this.style,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = true,
        _textSpan = textSpan,
        text = '',
        _type = TypeText.value,
        color = null,
        fontWeight = null;

  /// Text với fontsize = 24
  const CustomText.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.titleLarge;

  /// Text với fontsize = 22
  const CustomText.titleMedium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.titleMedium;

  /// Text với fontsize = 20
  const CustomText.titleSmall(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.titleSmall;

  /// Text với fontsize = 18
  const CustomText.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.bodyLarge;

  /// Text với fontsize = 16
  const CustomText.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.bodyMedium;

  /// Text với fontsize = 14
  const CustomText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.bodySmall;

  /// Text với fontsize = 12
  const CustomText.labelLarge(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.labelLarge;

  /// Text với fontsize = 10
  const CustomText.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.labelMedium;

  /// Text với fontsize = 8
  const CustomText.labelSmall(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = false,
    this.textAlign = TextAlign.start,
    this.textDirection,
  })  : _isTextRich = false,
        _textSpan = null,
        style = null,
        _type = TypeText.labelSmall;

  final String text;

  final InlineSpan? _textSpan;

  ///Nếu không phải là null, thì stype này sẽ sử dụng cho văn bản này.
  final TextStyle? style;

  ///Loại style của văn bản.
  final TypeText _type;

  ///Màu sắc để sử dụng khi viết văn bản.
  final Color? color;

  ///Độ dày của kiểu chữ sẽ sử dụng khi tô văn bản (ví dụ: in đậm).
  final FontWeight? fontWeight;

  ///Nếu maxLines = 1, văn bản sẽ không ngắt dòng. Nếu không, văn bản sẽ bị quấn ở mép hộp.
  final int? maxLines;

  ///Xử lý tràn hình ảnh.
  final TextOverflow? overflow;

  ///Nếu sai, các ký tự trong văn bản sẽ được định vị như thể có không gian ngang không giới hạn.
  final bool? softWrap;

  ///Làm thế nào văn bản nên được căn chỉnh theo chiều ngang.
  final TextAlign? textAlign;

  ///Định hướng của văn bản.
  final TextDirection? textDirection;

  final bool _isTextRich;

  TextStyle? _textStyle(BuildContext context) {
    switch (_type) {
      case TypeText.value:
        return style;
      case TypeText.titleLarge:
        return Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.titleMedium:
        return Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.titleSmall:
        return Theme.of(context).textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.bodySmall:
        return Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.labelLarge:
        return Theme.of(context).textTheme.labelLarge?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.labelMedium:
        return Theme.of(context).textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
      case TypeText.labelSmall:
        return Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isTextRich) {
      return Text(
        text,
        style: _textStyle(context),
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overflow,
        textAlign: textAlign,
        textDirection: textDirection,
      );
    } else {
      return Text.rich(
        _textSpan!,
        style: style,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overflow,
        textAlign: textAlign,
        textDirection: textDirection,
      );
    }
  }
}
