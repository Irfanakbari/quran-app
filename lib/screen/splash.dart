import 'package:flutter/material.dart';
import 'package:quran/screen/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.dicoding.com/blog/wp-content/uploads/2014/12/dicoding-header-logo-1.png",
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "My-Quran",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 67, 108, 96),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CircularProgressIndicator(
              strokeWidth: 4,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
