import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/SourceModel.dart';
import 'package:http/http.dart' as http;
class ApiManager {

  // http://api.aladhan.com/v1/timingsByCity?city=Menofia&country=Egypt 

  static Future<Data> fetchSource() async{
     Map<String, dynamic> queryParameters = {
      "city": "Menofia",
      "country": "Egypt"
    };
    Uri uri = Uri.http(
      "api.aladhan.com", // domain
      "/v1/timingsByCity", // endpoint
      queryParameters,
    );
     final response =await http.get(uri); 
     //debugPrint(response.body);
    var sourceData=Data.fromJson(jsonDecode(response.body));
    // handel status Code
   return sourceData;
  }
}