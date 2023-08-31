import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

const String apiKey = '26763d7bf2e94098192e629eb975dab0';
const String baseUrl = 'https://api.themoviedb.org/3';

class BaseClient {
  final client = http.Client();
  String baseURLImage = 'https://image.tmdb.org/t/p/original';

  //GET
  Future<dynamic> get(
    String api,
    String page,
  ) async {
    final url = Uri.parse(api + apiKey + page);

    log('url:  $url ');

    var response = await client.get(url);
    // print('Response status: ${response.statusCode}');

    var res = json.decode(utf8.decode(response.bodyBytes));
    // log('response:  $res ');
    //print(res);

    try {
      if (response.statusCode == 200) {
        return res;

        //return DanhSach.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else if (response.statusCode == 400) {
        throw Exception('Bad Request ');
      } else if (response.statusCode == 401) {
        Exception('Unauthorized');
      } else if (response.statusCode == 404) {
        Exception('Not Found');
      } else if (response.statusCode == 500) {
        Exception('Internal Server Error');
      } else {
        Exception('Error');
      }
    } catch (e) {
      print(e);
    }
  }
}
