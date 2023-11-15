import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';
import 'package:youtube_clone/common_components/base_widget/base_controller.dart';
import 'package:youtube_clone/models/video_model.dart';

class DetailVideoController extends BaseController {
  DetailVideoController(this.id);
  final int id;

  @override
  Future<Map<String, List<Map<String, Object?>?>?>?> loadData() async {
    params[fieldId] = id;
    var data =
        await getDio('https://datayoutube.000webhostapp.com/videodetail');
    return data;
  }

  VideoModel get detailVideo =>
      VideoModel(Methods.getList(getData, tblVideo).first);
}
