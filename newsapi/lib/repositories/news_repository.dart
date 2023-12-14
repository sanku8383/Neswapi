import 'dart:convert';
import 'package:newsapi/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=5fd1ece6e38845dfa0e32da6cd6b8348"));

    var data = jsonDecode(response.body);
    print(data);


    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _articleModel = ArticleModel.fromJson(item);
        _articleModelList.add(_articleModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList; // empty list
    }
  }
}