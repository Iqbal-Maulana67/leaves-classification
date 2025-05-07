import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:leaves_classification_application/models/tumpangAirList.dart';
import 'package:leaves_classification_application/widgets/indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0;
  String? _selectedLanguage;
  int _selectedRate = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DecorationImage _getBackground(int index) {
    if (_currentPage == index) {
      // Halaman aktif (pointer di tengah)
      return DecorationImage(
          image: AssetImage('assets/images/background_pointer.png'),
          fit: BoxFit.cover);
    } else {
      // Halaman lain
      return DecorationImage(
          image: AssetImage('assets/images/background_unpointer.png'),
          fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 30.0,
                          child: GestureDetector(
                            onTap: () => {Navigator.pop(context)},
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        spreadRadius: 0.5,
                                        blurRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(Icons.arrow_back),
                            ),
                          )),
                      Positioned(
                        top: 80.0,
                        child: GestureDetector(
                          onTap: () => _languageDialogBuilder(context),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(1, 1),
                                      spreadRadius: 0.5,
                                      blurRadius: 1)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(
                              'assets/images/language.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height * 0.02),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.05),
                        margin: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.05,
                            bottom: MediaQuery.sizeOf(context).height * 0.015),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/tumpang-air.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.sizeOf(context).width *
                                        0.05),
                                child: Text(
                                  AppLocalizations.of(context)!.tumpang_air,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "DMSans"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.sizeOf(context).width * 0.05,
                                ),
                                child: Text(
                                  "Peperomia pellucida",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "DMSans"),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.sizeOf(context).width * 0.08),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "100%",
                                style: TextStyle(
                                  fontFamily: "DMSans",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.05),
              child: Text(
                AppLocalizations.of(context)!.description,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14.0, fontFamily: "DMSans"),
                  AppLocalizations.of(context)!.tumpang_air_description),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.05),
              child: Text(
                AppLocalizations.of(context)!.benefit,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.sizeOf(context).width *
                  0.7, // Tinggi yang diinginkan
              margin: EdgeInsets.symmetric(vertical: 1.0),
              child: PageView.builder(
                itemCount: TumpangAirList.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  final plant = TumpangAirList[index];
                  var _scale = index == _currentPage ? 1.0 : 0.9;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          decoration: BoxDecoration(
                            image: _getBackground(index),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${plant.id}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "DMSans",
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.05,
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Text(
                                        getLocalizedTextTitle(
                                            context, plant.title),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: "DMSans",
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.07,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      getLocalizedTextDescription(
                                          context, plant.description),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          wordSpacing: 1.5),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    TumpangAirList.length,
                    (index) => Indicator(
                        isActive: _currentPage == index ? true : false))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _languageDialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            // Gunakan StatefulBuilder untuk memperbarui state dalam dialog
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10, right: 10),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close_rounded),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Pilih Bahasa',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _languageOption(setStateDialog,
                            "assets/images/logo_id.png", "Indonesia"),
                        _languageOption(setStateDialog,
                            "assets/images/logo_en.png", "English"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Terjemahkan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ));
          },
        );
      },
    );
  }

  Widget _languageOption(
      StateSetter setStateDialog, String assetPath, String language) {
    return GestureDetector(
      onTap: () {
        setStateDialog(() {
          _selectedLanguage = language;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black),
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

  Future<void> _rateDialogBulider(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setStateDialog) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 10, right: 5),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.close_rounded),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Berikan Umpan Balik',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            'Pendapat anda tentang aplikasi ini.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: [
                            _rateOptions(
                                setStateDialog,
                                Color.fromRGBO(240, 89, 48, 1),
                                1,
                                'assets/images/rate1.png'),
                            _rateOptions(
                                setStateDialog,
                                Color.fromRGBO(245, 146, 75, 1),
                                2,
                                'assets/images/rate2.png'),
                            _rateOptions(
                                setStateDialog,
                                Color.fromRGBO(255, 201, 0, 1),
                                3,
                                'assets/images/rate3.png'),
                            _rateOptions(
                                setStateDialog,
                                Color.fromRGBO(168, 212, 0, 1),
                                4,
                                'assets/images/rate4.png'),
                            _rateOptions(
                                setStateDialog,
                                Color.fromRGBO(90, 191, 0, 1),
                                5,
                                'assets/images/rate5.png')
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Email',
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never, // Supaya label tidak naik ke atas garis
                              alignLabelWithHint:
                                  true, // Membuat label tetap di atas
                              hintText: "Email",
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10,
                                  10), // Mengatur padding agar teks di kiri atas
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              isDense: true, // Mengurangi ukuran tinggi input
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Feedback',
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never, // Supaya label tidak naik ke atas garis
                              alignLabelWithHint:
                                  true, // Membuat label tetap di atas
                              hintText: "Feedback",
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10,
                                  10), // Mengatur padding agar teks di kiri atas
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              isDense: true, // Mengurangi ukuran tinggi input
                            ),
                            maxLines: 5,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'Kirim',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(217, 217, 217, 1))),
                                child: Text(
                                  'Batal',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          });
        });
  }

  Widget _rateOptions(
      StateSetter setStateDialog, Color color, int value, String imgPath) {
    return GestureDetector(
        onTap: () {
          setStateDialog(() {
            _selectedRate = value;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: MediaQuery.sizeOf(context).width * 0.1,
          height: MediaQuery.sizeOf(context).width * 0.1,
          decoration: BoxDecoration(
              border:
                  Border.all(color: color, width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(40),
              color: _selectedRate == value ? color : Colors.white),
          child: Image.asset(imgPath),
        ));
  }
}
