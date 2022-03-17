import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran/models/home_model.dart';

class HomeController {
  static const String url = 'https://quran-api-id.vercel.app/surahs';

  static Future<List<Data>?> getSurah() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return SurahModel.fromJson(json.decode(response.body)).data;
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
