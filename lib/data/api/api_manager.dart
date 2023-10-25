import 'dart:convert';

import 'package:news/data/model/SourceResponse.dart';
import 'package:http/http.dart';
abstract class ApiManager{
  static const String baseUrl="newsapi.org";
  static const String apiKey="51e1fb2cf16c4724afb509c9c4889045";
  static const String sourcesEndPoint="/v2/top-headlines/sources";
  static Future<List<Source>?> getSources()async {
    Uri url = Uri.parse("https://${baseUrl}$sourcesEndPoint?apiKey=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    if (response.statusCode >= 200 && response.statusCode < 300 &&
        sourceResponse.sources?.isNotEmpty ==true) {
      return sourceResponse.sources!;
    }
    throw Exception(sourceResponse.message);
  }
    static getArticles() {

    }
  }
