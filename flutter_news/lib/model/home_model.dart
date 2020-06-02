import 'package:json_annotation/json_annotation.dart';

part 'home_mode.g.dart';

@JsonSerializable()

class HomeModel {
  int code;
  String msg;
  List<HomeData> newlist;
}

@JsonSerializable()
class HomeData {
  String ctime;
  String title;
  String description;
  String picUrl;
  String url;
  HomeData(this.ctime, this.title, this.description, this.picUrl, this.url);
  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataFromJson(this);
}