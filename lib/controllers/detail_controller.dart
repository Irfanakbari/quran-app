import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/models/detail_model.dart';

class DetailController {
  static Future<Data?> getSurah(String surah) async {
    String url = 'https://quran-api-id.vercel.app/surahs/$surah';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyatModel.fromJson(json.decode(response.body)).data;
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
