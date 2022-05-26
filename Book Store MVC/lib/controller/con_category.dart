import 'package:dio/dio.dart';
import 'package:ebook_app/controller/api.dart';
import 'package:ebook_app/model/category/model_category.dart';

Future<List<ModelCategory>> fetchCategory(
    List<ModelCategory> fetchCategory) async {
  var request = await Dio().get(
      ApiConstant().baseUrl() + ApiConstant().api + ApiConstant().category);

  for (Map<String, dynamic> category in request.data) {
    fetchCategory.add(ModelCategory(
      catId: category['cat_id'],
      photoCat: category['photo_cat'],
      name: category['name'],
      status: category['status'],
    ));
  }
  return fetchCategory;
}
