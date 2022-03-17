import 'package:flutter/material.dart';
import 'package:quran/components/cardsurah.dart';
import 'package:quran/controllers/home_controller.dart';
import 'package:quran/screen/detail.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<dynamic> data;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeController.getSurah().then((value) {
      data = value!;
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
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: const Color.fromRGBO(37, 160, 106, 1),
          title: const Center(
              child: Text(
            'My-Quran',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: (!isLoading)
                  ? Column(
                      children: <Widget>[
                        for (var i = 0; i < data.length; i++)
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detail(
                                          arti: data[i].translation,
                                          ayat:
                                              data[i].numberOfAyahs.toString(),
                                          surah: data[i].name,
                                          tipe: data[i].revelation,
                                          number: data[i].number.toString(),
                                        ))),
                            child: CardSurah(
                              surah: data[i].name!,
                              arti: data[i].translation!,
                              ayat: data[i].numberOfAyahs!.toInt(),
                              tipe: data[i].revelation!,
                            ),
                          ),
                      ],
                    )
                  : Shimmer.fromColors(
                      child: Column(
                        children: [
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
                    )),
        ));
  }
}
