// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    json['code'] as int,
    json['message'] as String,
    (json['result'] as List)
        ?.map((e) =>
            e == null ? null : HomeData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': instance.result,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    json['passtime'] as String,
    json['title'] as String,
    json['image'] as String,
    json['path'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'path': instance.path,
      'image': instance.image,
      'title': instance.title,
      'passtime': instance.passtime,
      'url': instance.url,
    };
