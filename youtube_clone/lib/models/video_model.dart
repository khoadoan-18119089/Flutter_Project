import 'package:youtube_clone/common/enum.dart';
import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';
import 'package:youtube_clone/models/chanel_model.dart';

class VideoModel extends BaseVideoModel{
  VideoModel(super.data);

  ChanelModel get chanel => ChanelModel(data);

  Volume get typeVolume =>
      Methods.getObject<Volume>(data, fieldVolume) ?? Volume.volumeOff;

  set typeVolume(Volume type) {
    data.addAll({fieldVolume: type});
  }

  Subtitle get typeSubtitle =>
      Methods.getObject<Subtitle>(data, fieldSubtitle) ?? Subtitle.off;

  set typeSubtitle(Subtitle type) {
    data.addAll({fieldSubtitle: type});
  }
}
