import 'package:wowit/methods.dart';
import 'package:wowit/models/base_model.dart';

class MessModel extends BaseModel {
  MessModel(super.data);

  String get iD => Methods.getString(data, 'ID');
  String get mess => Methods.getString(data, 'mess');
  String get timer => Methods.getString(data, 'timer');
  String get emailNguoiGui => Methods.getString(data, 'emailNguoiGui');
  String get type => Methods.getString(data, 'type');
  String get call => Methods.getString(data, 'trangThaiCall');
}
