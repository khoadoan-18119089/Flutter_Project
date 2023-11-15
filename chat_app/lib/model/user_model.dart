import 'package:wowit/methods.dart';
import 'package:wowit/models/base_model.dart';

class UserModer extends BaseModel {
  UserModer(super.data);

  String get name => Methods.getString(data, 'name');
  String get avatar => Methods.getString(data, 'avatar');
  String get email => Methods.getString(data, 'email');
}
