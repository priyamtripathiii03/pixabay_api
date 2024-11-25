import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  Future<Map> fetchApiData() async {
    String api = "https://pixabay.com/api/?key=47200448-f8e8c4f845616c9b7b4008480&orientation=horizontal";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);
    if (response.statusCode == 200)
    {
      String data = response.body;
      Map json = jsonDecode(data);
      return json;
    }
    return {};
  }
  Future<Map> fetchApiDataBySearch(String search) async {
    Response response = await http.get(Uri.parse("https://pixabay.com/api/?key=47200448-f8e8c4f845616c9b7b4008480&orientation=horizontal&q=$search"));
    if (response.statusCode == 200)
    {
      return jsonDecode(response.body);
    }
    return {};
  }

}