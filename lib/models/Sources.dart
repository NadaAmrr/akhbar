//
// import 'package:akhbar/models/article.dart';
//
// class Sources {
//   Sources({
//     this.status,
//     this.totalResults,
//     this.articles,
//     this.code,
//     this.message,
//   });
//
//   Sources.fromJson(dynamic json) {
//     code = json['code'];
//     message = json['message'];
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = [];
//       json['articles'].forEach((v) {
//         articles?.add(Articles.fromJson(v));
//       });
//     }
//   }
//   String? code;
//   String? message;
//   String? status;
//   int? totalResults;
//   List<Articles>? articles;
//   Sources copyWith({
//     String? status,
//     int? totalResults,
//     List<Articles>? articles,
//   }) =>
//       Sources(
//         code: code ?? code,
//         message: message ?? message,
//         status: status ?? this.status,
//         totalResults: totalResults ?? this.totalResults,
//         articles: articles ?? this.articles,
//       );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['code'] = code;
//     map['message'] = message;
//     map['status'] = status;
//     map['totalResults'] = totalResults;
//     if (articles != null) {
//       map['articles'] = articles?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
