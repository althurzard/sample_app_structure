import 'package:go_networking_service/go_networking_service.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class NewsEnity implements BaseModelInterface {
  final String title;
  final String id;
  final String description;
  final List<String> categories;
  final List<String> medias;
  final int published;

  String formattedPublished(String languageCode) {
    var date = DateTime.fromMillisecondsSinceEpoch(published);
    var formattedDate = DateFormat.yMMMMd(languageCode).format(date);
    return formattedDate;
  }

  NewsEnity(
      {@required this.title,
      @required this.id,
      @required this.description,
      @required this.medias,
      @required this.categories,
      @required this.published});

  factory NewsEnity.fromJson(Map<String, dynamic> json) {
    List<String> category;
    if (json['category'] is String) {
      category = [json['category'].toString()];
    }
    return NewsEnity(
        title: json['title'],
        id: json['id'],
        description: json['description'],
        categories: category ??
            (json['category'] as List).map((e) => e.toString()).toList() ??
            [],
        medias:
            (json['medias'] as List).map((e) => e.toString()).toList() ?? [],
        published: json['published']);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
