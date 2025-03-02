import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaves_classification_application/camera_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  bool _startAnimation = false;
  bool _showLanguage = false;
  String? _selectedLanguage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 22, 19, 72),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 14.0));

    return Scaffold(
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(seconds: 1, milliseconds: 500),
            height: _startAnimation
                ? MediaQuery.sizeOf(context).height * 0.30
                : MediaQuery.sizeOf(context).height * 0.65,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Logo Lama
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _startAnimation ? 0 : 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),

                // Logo Baru
                AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: _startAnimation ? 1 : 0,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo2.png', // Ganti dengan path logo baru
                        width: 150, // Sesuaikan ukuran logo baru
                        height: 150,
                      ),
                    )),
              ],
            ),
          ),
          Stack(
            children: [
              AnimatedOpacity(
                opacity: _startAnimation ? 0 : 1,
                duration: const Duration(seconds: 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      child: const Text(
                        'Welcome To',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: const Text(
                        'Classification of Wild Plants as Medical Plants',
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _startAnimation ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      child: const Text(
                        'Select Language',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          Stack(
            children: [
              AnimatedOpacity(
                opacity: _startAnimation ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: _showLanguage
                    ? Column(
                        children: <Widget>[
                          _languageOption(
                              "assets/images/logo_id.png", "Indonesia"),
                          _languageOption(
                              "assets/images/logo_malay.png", "Malaysia"),
                          _languageOption(
                              "assets/images/logo_en.png", "English"),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: _startAnimation ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            child: SizedBox(
                                child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CameraPage()));
                                },
                                style: style,
                                child: const Text("Continue"),
                              ),
                            )),
                          )
                        ],
                      )
                    : const Column(),
              ),
              AnimatedOpacity(
                opacity: _startAnimation ? 0 : 1,
                duration: const Duration(seconds: 1),
                child: _startAnimation
                    ? const SizedBox()
                    : SizedBox(
                        child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _startAnimation = !_startAnimation;
                            });

                            Future.delayed(
                                const Duration(seconds: 1, milliseconds: 500),
                                () {
                              setState(() {
                                _showLanguage = true;
                              });
                            });
                          },
                          style: style,
                          child: const Text("Start Now"),
                        ),
                      )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _languageOption(String assetPath, String language) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: (_selectedLanguage == language)
                ? const Color.fromRGBO(194, 136, 248, 1)
                : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image.asset(
              assetPath,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 10),
            Text(
              language,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: (_selectedLanguage == language)
                  ? Image.asset(
                      'assets/images/check.png',
                      width: 20,
                      height: 20,
                    )
                  : null,
            ))
          ],
        ),
      ),
    );
  }
}
