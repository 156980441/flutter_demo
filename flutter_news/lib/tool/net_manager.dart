import 'dart:io';
import 'dart:convert';
import 'package:flutternews/model/home_model.dart';
import 'package:flutternews/model/currency_pairs.dart';
import 'package:flutternews/model/currency.dart';
import 'package:flutternews/base/base.dart';

class NetManager {
  Future<HomeModel> queryHomeData (int page) async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN, URL_PATH, {"count":"10","page":"$page"});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return HomeModel.fromJson(json.decode(responseBody));
  }

  Future<CurrencyPairModel> queryCurrencyPairsData () async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN_COINBASE, URL_PATH_PRODUCTS_COINBASE);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return CurrencyPairModel.fromJson(json.decode(responseBody));
  }

  Future<CurrencyModel> queryCurrencyData () async {
    var httpClient = HttpClient();
    var uri = Uri.http(URL_DOMAIN_COINBASE, URL_PATH_CURRENCIES_COINBASE);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    return CurrencyModel.fromJson(json.decode(responseBody));
  }
}