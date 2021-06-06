import 'package:clean_arch_tdd/modules/search/domain/entities/result_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_search_model.g.dart';

@JsonSerializable()
class ResultSearchModel extends ResultSearch {
  final String image;
  final String title;
  final String content;

  ResultSearchModel({this.image, this.title, this.content});
}
