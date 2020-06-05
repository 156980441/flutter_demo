import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class CurrencyModel {
  List<CurrencyData> result;
  CurrencyModel(this.result);
  factory CurrencyModel.fromJson(Map<String, dynamic> json)=>_$CurrencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}

@JsonSerializable()
class CurrencyData {
  String id;
  String name;
  CurrencyData(this.id, this.name);
  factory CurrencyData.fromJson(Map<String, dynamic> json) => _$CurrencyDataFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyDataToJson(this);
}