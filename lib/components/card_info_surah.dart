import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatefulWidget {
  final String? surah;
  final String? ayat;
  final String? arti;
  final String? tipe;
  final String? info;
  final String? urlAudio;
  const CardInfo(
      {Key? key,
      this.surah,
      this.ayat,
      this.arti,
      this.tipe,
      this.urlAudio,
      this.info})
      : super(key: key);

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
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
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(37, 160, 106, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            // BoxShadow(
            //   color: Color.fromRGBO(37, 160, 106, 1),
            //   blurRadius: 10,
            //   offset: Offset(0, 5),
            // ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.surah!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.arti!,
              style: const TextStyle(
                  color: Color.fromRGBO(169, 216, 200, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah Ayat : ' + widget.ayat!,
                  style: const TextStyle(
                    color: Color.fromRGBO(169, 216, 200, 1),
                    fontSize: 18,
                  ),
                ),
                (!isPlaying)
                    ? IconButton(
                        onPressed: () async {
                          await player.play(widget.urlAudio!);
                          setState(() {
                            isPlaying = true;
                          });
                        },
                        icon:
                            // icon play
                            const Icon(
                          Icons.play_arrow,
                          color: Color.fromARGB(255, 255, 0, 0),
                          size: 40,
                        ),
                      )
                    : IconButton(
                        onPressed: () async {
                          player
                              .stop(); // Usually you don't want to wait for playback to finish.
                          setState(() {
                            isPlaying = false;
                          });
                        },
                        icon:
                            // icon play
                            const Icon(
                          Icons.stop,
                          color: Color.fromARGB(255, 255, 0, 0),
                          size: 40,
                        ),
                      )
              ],
            ),
            Text(
              widget.tipe!,
              style: const TextStyle(
                  color: Color.fromRGBO(169, 216, 200, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // show dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Info'),
                    content: Text(widget.info!),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: const [
                  Text("Detail",
                      style: TextStyle(
                          color: Color.fromRGBO(169, 216, 200, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(169, 216, 200, 1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
