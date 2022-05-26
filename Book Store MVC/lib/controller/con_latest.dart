import 'package:dio/dio.dart';
import 'package:ebook_app/controller/api.dart';
import 'package:ebook_app/model/ebook/model_ebook.dart';

Future<List<ModelEbook>> fetchLatest(List<ModelEbook> fetchLatest) async {
  var request = await Dio()
      .get(ApiConstant().baseUrl() + ApiConstant().api + ApiConstant().latest);

  for (Map<String, dynamic> ebook in request.data) {
    fetchLatest.add(ModelEbook(
        id: ebook['id'],
        title: ebook['title'],
        photo: ebook['photo'],
        description: ebook['description'],
        catId: ebook['cat_id'],
        statusNews: ebook['status_news'],
        pdf: ebook['pdf'],
        date: ebook['date'],
        authorName: ebook['author_name'],
        publisherName: ebook['publisher_name'],
        pages: ebook['pages'],
        language: ebook['language'],
        rating: ebook['rating'],
        free: ebook['free']));
  }
  return fetchLatest;
}
