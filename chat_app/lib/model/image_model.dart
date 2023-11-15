import 'package:chat_app/common/field_name.dart';
import 'package:wowit/methods.dart';
import 'package:wowit/models/base_model.dart';

class ImageModel extends BaseModel {
  ImageModel(super.data);

  String get fileName => Methods.getString(data, fieldImageName);
  String get filePath => Methods.getString(data, fieldImagePath);
}
