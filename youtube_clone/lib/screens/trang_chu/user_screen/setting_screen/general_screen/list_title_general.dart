import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class GeneralListTitle extends StatelessWidget {
  const GeneralListTitle({
    super.key,
    required this.title,
    this.subtitle = 'Tắt',
    this.isSwitch = false,
    this.value = false,
    required this.show,
    this.onChanged,
  });

  final String title;

  final String subtitle;

  final Widget Function(String) show;

  final bool isSwitch;

  final bool value;

  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return _item(context);
  }

  Widget _item(BuildContext context) {
    return ListTile(
      title: CustomText.bodyLarge(title),
      subtitle: CustomText.bodySmall(subtitle),
      trailing: isSwitch
          ? Switch(
              value: value,
              onChanged: onChanged,
            )
          : null,
      onTap: () => _showDialog(context),
    );
  }

  Future _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => show.call(title),
    );
  }
}
