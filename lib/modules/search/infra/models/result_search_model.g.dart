// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultSearchModel _$ResultSearchModelFromJson(Map<String, dynamic> json) {
  return ResultSearchModel(
    image: json['avatar_url'] as String,
    title: json['login'] as String,
    content: json['url'] as String,
  );
}

Map<String, dynamic> _$ResultSearchModelToJson(ResultSearchModel instance) =>
    <String, dynamic>{
      'avatar_url': instance.image,
      'login': instance.title,
      'url': instance.content,
    };
