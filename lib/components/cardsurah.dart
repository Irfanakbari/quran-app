import 'package:flutter/material.dart';

class CardSurah extends StatelessWidget {
  final String surah;
  final String arti;
  final int ayat;
  final String tipe;
  const CardSurah(
      {Key? key,
      required this.surah,
      required this.arti,
      required this.ayat,
      required this.tipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(1, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surah,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(48, 107, 90, 1)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        arti,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 105, 141, 131)),
                      ),
                    ],
                  ),
                  // Text(
                  //   tipe + " / " + ayat.toString(),
                  //   maxLines: 1,
                  //   style: const TextStyle(
                  //       fontSize: 18, color: Color.fromARGB(255, 67, 108, 96)),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
