import 'package:flutter/material.dart';
import 'package:quran/components/card_info_surah.dart';
import 'package:quran/components/card_list_ayat.dart';
import 'package:quran/components/cardsurah.dart';
import 'package:quran/controllers/detail_controller.dart';
import 'package:shimmer/shimmer.dart';

class Detail extends StatefulWidget {
  final String surah;
  final String ayat;
  final String arti;
  final String tipe;
  final String number;
  const Detail(
      {Key? key,
      required this.surah,
      required this.ayat,
      required this.arti,
      required this.tipe,
      required this.number})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var datas;

  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DetailController.getSurah(widget.number).then((value) {
      datas = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
            color: const Color.fromARGB(255, 36, 35, 35),
          ),
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 70,
          backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
          title: Text(
            widget.surah,
            style: const TextStyle(
              color: Color.fromRGBO(48, 107, 90, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: (!isLoading)
              ? Column(
                  children: <Widget>[
                    CardInfo(
                      surah: widget.surah,
                      ayat: widget.ayat,
                      arti: widget.arti,
                      tipe: widget.tipe,
                      urlAudio: datas.audio,
                      info: datas.description,
                    ),
                    for (var i = 0; i < datas.ayahs.length; i++)
                      CardListAyat(
                          arab: datas.ayahs[i].arab,
                          soundUrl: datas.ayahs[i].audio.alafasy,
                          arti: datas.ayahs[i].translation,
                          tafsir: datas.ayahs[i].tafsir.kemenag.short)
                  ],
                )
              : Shimmer.fromColors(
                  child: Column(
                    children: [
                      const CardInfo(
                        surah: "widget.surah",
                        ayat: "widget.ayat",
                        arti: "widget.arti",
                        tipe: "widget.tipe",
                      ),
                      for (int i = 0; i < 10; i++)
                        const CardSurah(
                          surah: "Loading",
                          arti: "Loading",
                          ayat: 0,
                          tipe: "Loading",
                        ),
                    ],
                  ),
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[200]!,
                ),
        )));
  }
}
