// ignore_for_file: empty_constructor_bodies

class ArticleModel {
  late String id; // make the id field non-nullable
  late Source source; // change the type to Source
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  ArticleModel(
      {
      required this.id, // use camelCase for the parameter name
      required this.source, // use camelCase for the parameter name
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt, // use camelCase for the parameter name
      required this.content});

  // ignore: use_function_type_syntax_for_parameters
   ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id']; // assign the id field
    source = Source.fromJson(json['source']); // assign the source field
    author = json['author']; // use this.author instead of var author
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content']; // uncomment this line
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{}; 
    // use camelCase for data
    data['id'] = id; // assign the id field
    data['source'] = source.toJson(); // call the toJson() method on the source field
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source{
  late String id;
  late String name;

  Source({required this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json) { 
    id = json['id'];
    name = json['name'];
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
