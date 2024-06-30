
import 'package:akhbar/models/source.dart';

class SourcesResponse {
  SourcesResponse({
    this.status,
    this.sources,
    this.code,
    this.message,
  });

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  List<Source>? sources;
  String? code;
  String? message;
  SourcesResponse copyWith({
    String? status,
    List<Source>? sources,
    String? message,
    String? code,
  }) =>
      SourcesResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
        message: message ?? this.message,
        code: code ?? this.code,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

