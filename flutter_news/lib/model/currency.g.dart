// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return CurrencyModel(
    (json['result'] as List)
        ?.map((e) =>
            e == null ? null : CurrencyData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

CurrencyData _$CurrencyDataFromJson(Map<String, dynamic> json) {
  return CurrencyData(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$CurrencyDataToJson(CurrencyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
