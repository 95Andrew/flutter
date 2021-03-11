import 'dart:convert';

import 'package:flutter_app/data/dto/unsplash.dart';
import 'package:flutter_app/shared/constants.dart';
import 'package:http/http.dart' as http;


class UnsplashApi {
  Future<Unsplash> getUnsplash() async {
    final url = '$baseUrl/search/photos?per_page=20&client_id=$key&query=nature';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return Unsplash.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
