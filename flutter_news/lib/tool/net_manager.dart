import 'dart:io';
import 'package:flutternews/base/base.dart';
import 'dart:convert';

class NetManager {
  Future<String> queryHomeData (int page) async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN, URL_PATH, {"key":URL_KEY,"num":"10","page":"$page"});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return responseBody;
  }
}