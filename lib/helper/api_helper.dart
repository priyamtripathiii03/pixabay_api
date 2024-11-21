import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  final String api = "https://pixabay.com/api/?key=47200448-f8e8c4f845616c9b7b4008480&orientation=horizontal";

  Future<Map> fetchApiData() async {
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

}