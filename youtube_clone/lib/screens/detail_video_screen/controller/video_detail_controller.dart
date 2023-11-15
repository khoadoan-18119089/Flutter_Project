import 'package:youtube_clone/common_components/video/controller/video_controller.dart';
import 'package:youtube_clone/models/video_model.dart';

class VideoDetailController extends VideoController {
  VideoDetailController(this._model) : super(_model);

  final VideoModel _model;

  @override
  bool get autoPlay => true;

  void forward() {
    Duration targetPosition = position + const Duration(seconds: 10);
    seekTo(targetPosition);
  }

  void rewind() {
    Duration targetPosition = position - const Duration(seconds: 10);
    seekTo(targetPosition);
  }
}
