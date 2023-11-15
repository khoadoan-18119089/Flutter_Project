import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';
import 'package:youtube_clone/models/chanel_model.dart';

class ShortModel extends BaseVideoModel {
  ShortModel(super.data);

  ChanelModel get chanel => ChanelModel(data);

  Duration? get position => Methods.getDuration(data, fieldPosition);

  set position(Duration? newPosition) {
    data.addAll({fieldPosition: newPosition});
  }
}
