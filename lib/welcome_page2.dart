import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 22, 19, 72),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 14.0));
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.sizeOf(context).height * 0.65,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/login_background.png'),
              fit: BoxFit.cover,
            )),
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0),
            child: const Text(
              'Welcome To',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            // color: Colors.purple,
            child: const Text(
              'Classification of Wild Plants as Medical Plants',
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          SizedBox(
            child: ElevatedButton(
                onPressed: () {}, style: style, child: Text("Start Now")),
          ),
        ],
      ),
    );
  }
}
