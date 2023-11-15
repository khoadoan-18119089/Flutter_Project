import 'package:youtube_clone/common_components/video/controller/video_controller.dart';
import 'package:youtube_clone/models/short_model.dart';

class ShortController extends VideoController {
  ShortController(this._model) : super(_model);

  final ShortModel _model;

  @override
  bool get autoPlay => true;

  @override
  bool get isLoop => true;
}
