import 'package:flutter/material.dart';
import 'package:youtube_clone/common_components/custom_text.dart';

class DialogRadio<T> extends StatelessWidget {
  const DialogRadio({
    super.key,
    required this.title,
    this.values,
    this.texts,
    this.groupValue,
    this.onChanged,
  });

  final String title;

  final List<T>? values;

  final T? groupValue;

  final void Function(T?)? onChanged;

  final List<String>? texts;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText.titleMedium(title),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.5,
              ),
              child: body(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText.titleSmall('Hủy'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _widgets(context),
      ),
    );
  }

  List<Widget> _widgets(BuildContext context) {
    List<Widget> list = [];
    if (values == null) return list;
    for (int i = 0; i < values!.length; i++) {
      list.add(
        RadioListTile<T>(
          title: CustomText.bodyLarge(
              texts != null && texts!.isNotEmpty ? texts![i] : ''),
          value: values![i],
          groupValue: groupValue,
          onChanged: (e) {
            onChanged?.call(e);
            Navigator.pop(context);
          },
          activeColor: Colors.blue,
        ),
      );
    }
    return list;
  }
}
