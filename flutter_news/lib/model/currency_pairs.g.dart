// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_pairs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyPairModel _$CurrencyPairModelFromJson(Map<String, dynamic> json) {
  return CurrencyPairModel(
    (json['result'] as List)
        ?.map((e) => e == null
            ? null
            : CurrencyPairData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CurrencyPairModelToJson(CurrencyPairModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

CurrencyPairData _$CurrencyPairDataFromJson(Map<String, dynamic> json) {
  return CurrencyPairData(
    json['id'] as String,
    json['base_currency'] as String,
    json['quote_currency'] as String,
    json['display_name'] as String,
  );
}

Map<String, dynamic> _$CurrencyPairDataToJson(CurrencyPairData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'base_currency': instance.base_currency,
      'quote_currency': instance.quote_currency,
      'display_name': instance.display_name,
    };
