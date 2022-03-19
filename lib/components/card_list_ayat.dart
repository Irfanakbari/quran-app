import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CardListAyat extends StatefulWidget {
  final String arab;
  final String arti;
  final String? soundUrl;
  final String? tafsir;
  const CardListAyat(
      {Key? key,
      required this.arab,
      required this.arti,
      this.soundUrl,
      this.tafsir})
      : super(key: key);

  @override
  State<CardListAyat> createState() => _CardListAyatState();
}

class _CardListAyatState extends State<CardListAyat> {
  final player = AudioPlayer();
  bool isPlaying = false;
  bool isTafsir = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
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
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arab,
                maxLines: 3,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: (!isPlaying)
                        ? const Color.fromRGBO(48, 107, 90, 1)
                        : Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.arti.toString().trim(),
                maxLines: 3,
                textAlign: TextAlign.left,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      (!isPlaying)
                          ? TextButton.icon(
                              label: const Text(
                                "Play",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 67, 108, 96)),
                              ),
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
                          : TextButton.icon(
                              label: const Text(
                                "Stop",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              icon: const Icon(
                                Icons.stop,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                player.stop();
                                setState(() {
                                  isPlaying = false;
                                });
                              },
                            ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  (!isTafsir)
                      ? TextButton.icon(
                          onPressed: () {
                            setState(() {
                              isTafsir = !isTafsir;
                            });
                          },
                          icon: const Icon(
                            Icons.book,
                            color: Color.fromRGBO(48, 107, 90, 1),
                          ),
                          label: const Text(
                            'Tafsir',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(48, 107, 90, 1)),
                          ),
                        )
                      : TextButton.icon(
                          onPressed: () {
                            setState(() {
                              isTafsir = !isTafsir;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_upward,
                            color: Color.fromRGBO(48, 107, 90, 1),
                          ),
                          label: const Text(
                            'Hide',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(48, 107, 90, 1)),
                          ),
                        )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              (isTafsir)
                  ? Text(
                      widget.tafsir.toString().trim(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Color.fromARGB(255, 105, 141, 131)),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
