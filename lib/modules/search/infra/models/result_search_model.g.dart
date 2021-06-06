// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultSearchModel _$ResultSearchModelFromJson(Map<String, dynamic> json) {
  return ResultSearchModel(
    image: json['image'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ResultSearchModelToJson(ResultSearchModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'content': instance.content,
    };
