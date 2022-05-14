// To parse this JSON data, do
//
//     final newsResponseModel = newsResponseModelFromJson(jsonString);

import 'dart:convert';

NewsResponseModel newsResponseModelFromJson(String str) => NewsResponseModel.fromJson(json.decode(str));

String newsResponseModelToJson(NewsResponseModel data) => json.encode(data.toJson());

class NewsResponseModel {
    NewsResponseModel({
        this.status,
        this.totalResults,
        this.articles,
    });

    final String? status;
    final int? totalResults;
    final List<Article>? articles;

    factory NewsResponseModel.fromJson(Map<String, dynamic> json) => NewsResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    final Source? source;
    final dynamic author;
    final dynamic title;
    final dynamic description;
    final dynamic url;
    final dynamic urlToImage;
    final DateTime? publishedAt;
    final dynamic content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null? '':json["description"] ,
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? '' : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    final dynamic? id;
    final String? name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
