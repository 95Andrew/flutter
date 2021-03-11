

import 'package:flutter_app/data/api/unsplash_api.dart';
import 'package:flutter_app/data/dto/unsplash.dart';

class UnsplashRepository {
  final UnsplashApi _api = UnsplashApi();
  Future<Unsplash> getUnsplash() async {
    return await _api.getUnsplash();
  }
}
