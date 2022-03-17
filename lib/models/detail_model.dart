class AyatModel {
  bool? success;
  String? message;
  Data? data;

  AyatModel({this.success, this.message, this.data});

  AyatModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  Bismillah? bismillah;
  List<Ayahs>? ayahs;

  Data(
      {this.number,
      this.numberOfAyahs,
      this.name,
      this.translation,
      this.revelation,
      this.description,
      this.audio,
      this.bismillah,
      this.ayahs});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberOfAyahs = json['numberOfAyahs'];
    name = json['name'];
    translation = json['translation'];
    revelation = json['revelation'];
    description = json['description'];
    audio = json['audio'];
    bismillah = json['bismillah'] != null
        ? Bismillah.fromJson(json['bismillah'])
        : null;
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }
}

class Bismillah {
  String? arab;
  String? translation;
  Audio? audio;

  Bismillah({this.arab, this.translation, this.audio});

  Bismillah.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    translation = json['translation'];
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
  }
}

class Audio {
  String? alafasy;
  String? ahmedajamy;
  String? husarymujawwad;
  String? minshawi;
  String? muhammadayyoub;
  String? muhammadjibreel;

  Audio(
      {this.alafasy,
      this.ahmedajamy,
      this.husarymujawwad,
      this.minshawi,
      this.muhammadayyoub,
      this.muhammadjibreel});

  Audio.fromJson(Map<String, dynamic> json) {
    alafasy = json['alafasy'];
    ahmedajamy = json['ahmedajamy'];
    husarymujawwad = json['husarymujawwad'];
    minshawi = json['minshawi'];
    muhammadayyoub = json['muhammadayyoub'];
    muhammadjibreel = json['muhammadjibreel'];
  }
}

class Ayahs {
  Number? number;
  String? arab;
  String? translation;
  Audio? audio;
  Image? image;
  Tafsir? tafsir;
  Meta? meta;

  Ayahs(
      {this.number,
      this.arab,
      this.translation,
      this.audio,
      this.image,
      this.tafsir,
      this.meta});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'] != null ? Number.fromJson(json['number']) : null;
    arab = json['arab'];
    translation = json['translation'];
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    tafsir = json['tafsir'] != null ? Tafsir.fromJson(json['tafsir']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}

class Number {
  int? inQuran;
  int? inSurah;

  Number({this.inQuran, this.inSurah});

  Number.fromJson(Map<String, dynamic> json) {
    inQuran = json['inQuran'];
    inSurah = json['inSurah'];
  }
}

class Image {
  String? primary;
  String? secondary;

  Image({this.primary, this.secondary});

  Image.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
  }
}

class Tafsir {
  Kemenag? kemenag;
  String? quraish;
  String? jalalayn;

  Tafsir({this.kemenag, this.quraish, this.jalalayn});

  Tafsir.fromJson(Map<String, dynamic> json) {
    kemenag =
        json['kemenag'] != null ? Kemenag.fromJson(json['kemenag']) : null;
    quraish = json['quraish'];
    jalalayn = json['jalalayn'];
  }
}

class Kemenag {
  String? short;
  String? long;

  Kemenag({this.short, this.long});

  Kemenag.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }
}

class Meta {
  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  Meta(
      {this.juz,
      this.page,
      this.manzil,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  Meta.fromJson(Map<String, dynamic> json) {
    juz = json['juz'];
    page = json['page'];
    manzil = json['manzil'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'] != null ? Sajda.fromJson(json['sajda']) : null;
  }
}

class Sajda {
  bool? recommended;
  bool? obligatory;

  Sajda({this.recommended, this.obligatory});

  Sajda.fromJson(Map<String, dynamic> json) {
    recommended = json['recommended'];
    obligatory = json['obligatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recommended'] = recommended;
    data['obligatory'] = obligatory;
    return data;
  }
}
