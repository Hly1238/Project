import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project/config/urlAPI.dart';
import 'package:project/models/account.dart';

class Account {
  var client = http.Client();
  Map<String, String> customHeaders = {
    'X-TOKEN-ACCESS': UrlAPI.token,
    "content-type": "application/json"
  };

  Future<dynamic> login(
      {required String username, required String password}) async {
    var body = {'username': username, 'password': password};
    var response = await client.post(
      Uri.parse(UrlAPI.login),
      headers: customHeaders,
      body: jsonEncode(body),
    );

    return jsonDecode(response.body)['message'];
  }

  Future<dynamic> register({required AccountModel account}) async {
    var response = await client.post(
      Uri.parse(UrlAPI.register),
      headers: customHeaders,
      body: jsonEncode(account.toJson()),
    );
    print(response.body);
    return jsonDecode(response.body)['message'];
  }
}
