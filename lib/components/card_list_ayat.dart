import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CardListAyat extends StatefulWidget {
  final String arab;
  final String arti;
  final String? soundUrl;
  const CardListAyat(
      {Key? key, required this.arab, required this.arti, this.soundUrl})
      : super(key: key);

  @override
  State<CardListAyat> createState() => _CardListAyatState();
}

class _CardListAyatState extends State<CardListAyat> {
  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: (!isPlaying) ? Colors.white : Colors.green,
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
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.arab,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: (!isPlaying)
                            ? const Color.fromRGBO(48, 107, 90, 1)
                            : Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.arti,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 18,
                        color: (!isPlaying)
                            ? const Color.fromARGB(255, 105, 141, 131)
                            : Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      (!isPlaying)
                          ? IconButton(
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Color.fromRGBO(48, 107, 90, 1),
                              ),
                              onPressed: () async {
                                player.play(widget.soundUrl!);
                                setState(() {
                                  isPlaying = true;
                                });
                                player.onPlayerCompletion.listen((_) {
                                  setState(() {
                                    isPlaying = false;
                                  });
                                });
                              },
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.stop,
                                color: Color.fromRGBO(48, 107, 90, 1),
                              ),
                              onPressed: () async {
                                player.stop();
                                setState(() {
                                  isPlaying = false;
                                });
                              },
                            ),
                      (!isPlaying)
                          ? const Text(
                              'Play',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(48, 107, 90, 1)),
                            )
                          : const Text(
                              'Stop',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(48, 107, 90, 1)),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
