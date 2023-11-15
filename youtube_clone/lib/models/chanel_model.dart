import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/video/model/base_video_model.dart';

class ChanelModel extends BaseVideoModel{
  ChanelModel(super.data);

  String get nameChanel => Methods.getString(data, fieldNameChanel);

  String get imgChanel => Methods.getString(data, fieldImgChamel);
  
}