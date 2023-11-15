import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common/methods.dart';

class BaseModel {
  BaseModel(this.data);
  final Map<String, Object?> data;

  int get id => Methods.getInt(data, fieldId);
}
