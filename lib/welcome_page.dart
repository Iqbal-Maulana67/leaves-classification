import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leaves_classification_application/camera_page.dart';
import 'package:leaves_classification_application/provider/local_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

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
                      child: Text(
                        AppLocalizations.of(context)!.select_language,
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
                              "assets/images/logo_en.png", "English"),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: _startAnimation ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            child: SizedBox(
                                child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (_selectedLanguage == null ||
                                      _selectedLanguage!.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Please select one of the languages'),
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CameraPage()));
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(158, 179, 132, 1),
                                          Color.fromRGBO(68, 77, 57, 1)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        stops: [0, 1.0]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.choose,
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
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
                        child: GestureDetector(
                          onTap: () {
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
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(158, 179, 132, 1),
                                    Color.fromRGBO(68, 77, 57, 1)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: [0, 1.0]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Start Now",
                              style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
        final localeProvider =
            Provider.of<LocaleProvider>(context, listen: false);
        setState(() {
          _selectedLanguage = language;
        });

        if (language == "Indonesia") {
          localeProvider.setLocale(const Locale('id'));
        } else if (language == "English") {
          localeProvider.setLocale(const Locale('en'));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: (_selectedLanguage == language)
                ? const Color.fromRGBO(158, 179, 132, 1)
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
