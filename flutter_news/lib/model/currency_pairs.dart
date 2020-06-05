import 'package:json_annotation/json_annotation.dart';

part 'currency_pairs.g.dart';

@JsonSerializable()
class CurrencyPairModel {
  List<CurrencyPairData> result;
  CurrencyPairModel(this.result);
  factory CurrencyPairModel.fromJson(Map<String, dynamic> json)=>_$CurrencyPairModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyPairModelToJson(this);
}

@JsonSerializable()
class CurrencyPairData {
  String id;
  String base_currency;
  String quote_currency;
  String display_name;
  CurrencyPairData(this.id, this.base_currency, this.quote_currency, this.display_name);
  factory CurrencyPairData.fromJson(Map<String, dynamic> json) => _$CurrencyPairDataFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyPairDataToJson(this);
}