import 'package:equatable/equatable.dart';
import 'package:quis_kebangsaan/src/data/model/TopicModel.dart';

class TopicResponse {
  final List<TopicModel>? topics;

  const TopicResponse({
    this.topics,
  });

  // factory TopicResponse.fromJson(Map<String, dynamic> json) => ArticleResponse(
  //   articles: json["articles"] == null
  //       ? null
  //       : List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "status": status,
  //   "totalResults": totalResults,
  //   "articles": articles == null
  //       ? null
  //       : List<dynamic>.from(articles!.map((x) => x.toJson())),
  // };
  //
  // Articles toEntity() {
  //   return Articles(
  //     status: status,
  //     totalResults: totalResults,
  //     articles: articles == null
  //         ? null
  //         : articles!.map((x) => x.toEntity()).toList(),
  //   );
  // }
  //
  // @override
  // List<Object?> get props => [
  //   status,
  //   totalResults,
  //   articles,
  // ];
}