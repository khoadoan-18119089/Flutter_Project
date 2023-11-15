import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/widgets/wow_icon.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    this.height,
    this.width,
    this.initValue,
    this.hintText = 'SEARCH_BAR_HINT',
    this.controller,
    required this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
    this.timeDelay = const Duration(milliseconds: 500),
    this.filled = true,
    this.enabled = true,
    this.fillColor,
    this.border,
    this.contentPadding,
  });

  final String? initValue;

  final String? hintText;

  final TextEditingController? controller;

  final Function(String value)? onChanged;

  final Function()? onTap;

  final Function()? onEditingComplete;

  final Function(String value)? onSubmitted;

  final FocusNode? focusNode;

  final double? height;

  final double? width;

  final bool autofocus;

  final bool enabled;

  final Duration timeDelay;

  final bool filled;

  final Color? fillColor;

  final InputBorder? border;

  final EdgeInsets? contentPadding;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;

  late bool _canClear;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initValue != null) {
      _controller.text = widget.initValue!;
    }
    _canClear = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onTextChange);
  }

  void _onTextChange() {
    String value = _controller.text;
    bool canClear = value.isNotEmpty;
    if (_canClear != canClear) {
      setState(() {
        _canClear = canClear;
      });
    }
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(
      widget.timeDelay,
      () {
        widget.onChanged?.call(value);
        _timer?.cancel();
      },
    );
  }

  void _onClear() {
    setState(() {
      if (_timer != null) {
        _timer?.cancel();
      }
      _controller.text = '';
      _canClear = false;
      widget.onChanged?.call('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextField(
        controller: _controller,
        maxLines: 1,
        minLines: 1,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          filled: widget.filled,
          fillColor: widget.fillColor,
          prefixIcon: prefix(),
          suffixIcon: _canClear ? suffix() : null,
          border: widget.border,
          enabledBorder: widget.border,
          disabledBorder: widget.border,
          focusedBorder: widget.border,
          errorBorder: widget.border,
          focusedErrorBorder: widget.border,
        ),
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }

  Widget prefix() {
    return const WowIcon(
      Icons.search_outlined,
      size: 24,
      color: TBTColor.greyA4AF,
    );
  }

  Widget suffix() {
    return GestureDetector(
      onTap: _onClear,
      child: const WowIcon(
        Icons.close_rounded,
        size: 24,
        color: TBTColor.greyA4AF,
      ),
    );
  }
}
