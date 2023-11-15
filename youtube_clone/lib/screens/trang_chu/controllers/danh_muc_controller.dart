import 'package:youtube_clone/common/field_name.dart';
import 'package:youtube_clone/common_components/base_widget/base_controller.dart';

class DanhMucController extends BaseController {
  @override
  Future<Map<String, List<Map<String, Object?>?>?>?> loadData() async {
    Map<String, List<Map<String, Object?>?>?> data = {
      'tbldsMuc': [
        {
          fieldId: 1,
          fieldTitle: 'All',
        },
        {
          fieldId: 2,
          fieldTitle: 'MuSic',
        },
        {
          fieldId: 3,
          fieldTitle: 'NoCopyrightSounds',
        },
        {
          fieldId: 4,
          fieldTitle: 'House Music',
        },
        {
          fieldId: 5,
          fieldTitle: 'Young MuSic',
        },
        {
          fieldId: 6,
          fieldTitle: 'League of Legents',
        },
        {
          fieldId: 7,
          fieldTitle: 'Arena of VAlor',
        },
        {
          fieldId: 8,
          fieldTitle: 'Animated Films',
        },
        {
          fieldId: 9,
          fieldTitle: 'Recenly Uploaded',
        },
        {
          fieldId: 10,
          fieldTitle: 'New to You',
        },
      ],
    };
    return data;
  }

  List<Map<String, Object?>?> get dsMuc => getData['tbldsMuc'] ?? [];
}
