import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_assignm_flutter/model/weathermodel.dart';

TextEditingController city = TextEditingController(text: 'karachi');
getdata() async {
  try {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${city.text}&appid=f5783e1fee68d6228723ecc46804ee40';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    Map<String, dynamic> body = jsonDecode(response.body);
    var data = weathermodel.fromJson(body);
    return data;
  } catch (e) {
    print(e);
  }
}
