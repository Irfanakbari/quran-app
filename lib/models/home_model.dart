class SurahModel {
  bool? success;
  String? message;
  List<Data>? data;

  SurahModel({this.success, this.message, this.data});

  SurahModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? number;
  int? numberOfAyahs;
  String? name;
  String? translation;
  String? revelation;
  String? description;
  String? audio;

  Data(
      {this.number,
      this.numberOfAyahs,
      this.name,
      this.translation,
      this.revelation,
      this.description,
      this.audio});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberOfAyahs = json['numberOfAyahs'];
    name = json['name'];
    translation = json['translation'];
    revelation = json['revelation'];
    description = json['description'];
    audio = json['audio'];
  }
}
