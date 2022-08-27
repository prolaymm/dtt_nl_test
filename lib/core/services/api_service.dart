import 'package:d_tt_nl_code_test/utils/token_constance.dart';

import 'package:http/http.dart' as http;

import '../../utils/api_route.dart';

class ApiService {
  final String baseUrl = apiBaseUrl;

  String token = lToken;



/*

  Future<dynamic> postData(
      {bool? isHeader,
      Map? body,
      required String url,
      bool? isJsonEncode}) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + url),
          body: isJsonEncode ?? false ? jsonEncode(body) : body,
          headers: isHeader ?? false ? getHeader() : {});

      return response;
    } catch (error) {
      return error;
    }
  }
*/

  Future<dynamic> getData(
      {bool? isHeader, required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + url),
          headers: isHeader ?? false ? getHeader() : {});

      return response;
    } catch (error) {
      return error;
    }
  }

  getHeader() {
    return {
    /*  'Content-type': 'application/json',
      'Accept': 'application/json',*/
      'Access-Key': token
    };
  }
}
