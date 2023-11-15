import 'package:chat_app/controllers/up_down_Image_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:wow_views/common/color.dart';
import 'package:wowit/widgets/wow_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.name, this.height = 40})
      : super(key: key);
  final String name;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: UpDownImageController.downLoadUrl(name: name),
        builder: (_, snapshot) {
          return Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              clipBehavior: Clip.antiAlias,
              child: WowImage.url(
                snapshot.data.toString(),
                boxFit: BoxFit.cover,
              ));
        });
  }

  static Widget url({required String url, required double height}) {
    return Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: TBTColor.greyA4AF),
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(20),
        child: WowImage.url(url));
  }
}
