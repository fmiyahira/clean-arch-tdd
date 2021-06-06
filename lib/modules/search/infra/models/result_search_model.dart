import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_search_model.g.dart';

@JsonSerializable()
class ResultSearchModel extends ResultSearch {
  final String image;
  final String title;
  final String content;

  Map<String, dynamic> toJson() => _$ResultSearchModelToJson(this);
  factory ResultSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ResultSearchModelFromJson(json);

  ResultSearchModel({this.image, this.title, this.content});
}
