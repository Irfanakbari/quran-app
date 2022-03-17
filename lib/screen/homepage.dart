import 'package:flutter/material.dart';
import 'package:quran/screen/aboutpage.dart';
import 'package:quran/screen/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List menu = [
    const Home(),
    About(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: menu[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(37, 160, 106, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
        currentIndex: index,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
