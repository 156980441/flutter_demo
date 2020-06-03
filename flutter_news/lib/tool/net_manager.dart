import 'dart:io';
import 'package:flutternews/base/base.dart';
import 'dart:convert';
import 'package:flutternews/model/home_model.dart';

class NetManager {
  Future<HomeModel> queryHomeData (int page) async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN, URL_PATH, {"count":"10","page":"$page"});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return HomeModel.fromJson(json.decode(responseBody));
  }
}