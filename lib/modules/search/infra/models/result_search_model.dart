import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_search_model.g.dart';

@JsonSerializable()
class ResultSearchModel extends ResultSearch {
  @JsonKey(name: 'avatar_url')
  final String image;
  @JsonKey(name: 'login')
  final String title;
  @JsonKey(name: 'url')
  final String content;

  // Map<String, dynamic> toJson() => _$ResultSearchModelToJson(this);

  factory ResultSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ResultSearchModelFromJson(json);

  ResultSearchModel({this.image, this.title, this.content});
}
