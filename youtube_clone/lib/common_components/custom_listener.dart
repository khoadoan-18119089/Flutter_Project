import 'package:flutter/material.dart';

class CustomListener<T extends ChangeNotifier> extends StatefulWidget {
  const CustomListener({
    super.key,
    required this.model,
    required this.builder,
  });
  final T model;

  final Widget Function(T model) builder;

  @override
  State<CustomListener<T>> createState() => _CustomListenerState<T>();
}

class _CustomListenerState<T extends ChangeNotifier>
    extends State<CustomListener<T>> {
  @override
  void initState() {
    widget.model.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.model.removeListener(update);
    super.dispose();
  }

  void update() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.model);
  }
}

class CustomListener2<T extends ChangeNotifier, S> extends StatefulWidget {
  const CustomListener2({
    super.key,
    required this.model,
    required this.value,
    required this.builder,
  });
  final T model;

  final S value;

  final Widget Function(T model) builder;

  @override
  State<CustomListener2<T, S>> createState() => _CustomListener2State<T, S>();
}

class _CustomListener2State<T extends ChangeNotifier, S>
    extends State<CustomListener2<T, S>> {
  late S value;
  @override
  void initState() {
    value = widget.value;
    widget.model.addListener(() => update(widget.value));
    super.initState();
  }

  @override
  void dispose() {
    widget.model.removeListener(()=> update(widget.value));
    super.dispose();
  }

  void update(S newValue) {
    if (mounted && newValue != value) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(widget.model);
  }
}
