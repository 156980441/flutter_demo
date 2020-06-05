import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  int code;
  String message;
  List<HomeData> result;
  HomeModel(this.code, this.message, this.result);
  factory HomeModel.fromJson(Map<String, dynamic> json)=>_$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class HomeData {
  String path;
  String image;
  String title;
  String passtime;
  String url;
  HomeData(this.passtime, this.title, this.image, this.path, this.url);
  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}