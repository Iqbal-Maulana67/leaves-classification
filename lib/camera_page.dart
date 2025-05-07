import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:leaves_classification_application/result_page/brotowali_result.dart';
import 'package:leaves_classification_application/result_page/pegagan_result.dart';
import 'package:leaves_classification_application/result_page/rambusa_result.dart';
import 'package:leaves_classification_application/result_page/rumput_minjangan_result.dart';
import 'package:leaves_classification_application/result_page/sembung_rambat_result.dart';
import 'package:leaves_classification_application/result_page/tumpang_air_result.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  String? _capturedImagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _cameraController = CameraController(
        cameras![0],
        ResolutionPreset.high,
      );

      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  Future<void> _takePhoto() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final XFile photo = await _cameraController!.takePicture();
      setState(() {
        _capturedImagePath = photo.path;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Foto berhasil diambil: ${photo.path}')),
      // );
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _capturedImagePath = image.path;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Gambar dipilih: ${image.path}')),
      // );
    }
  }

  Future<void> _uploadImage() async {
    if (_capturedImagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Pilih atau ambil gambar terlebih dahulu')),
      );
      return;
    }

    var uri = Uri.parse(
        "https://0dbc-140-213-244-229.ngrok-free.app/api/predict-id/");
    var request = http.MultipartRequest('POST', uri)
      ..files
          .add(await http.MultipartFile.fromPath('gmbr', _capturedImagePath!));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      String plantClass = jsonResponse["class"];
      double accuracy = jsonResponse["accuracy"];
      double trimmedAccuracy = double.parse(accuracy.toStringAsFixed(1));

      if (plantClass.toLowerCase() == "pegagan") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PegaganResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      if (plantClass.toLowerCase() == "brotowali") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrotowaliResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      if (plantClass.toLowerCase() == "rambusa") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RambusaResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      if (plantClass.toLowerCase() == "rumput minjangan") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RumputMinjanganResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      if (plantClass.toLowerCase() == "sembung rambat") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SembungRambatResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      if (plantClass.toLowerCase() == "tumpang air") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TumpangAirResult(
              accuracy: trimmedAccuracy,
            ),
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Hasil: $plantClass (${accuracy.toStringAsFixed(2)}%)"),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal mengunggah gambar')),
      );
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/camera_background.png'),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          // Preview Kamera
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.75,
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: _capturedImagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: Image.file(
                          File(_capturedImagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : _isCameraInitialized
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height * 0.75,
                            child: CameraPreview(_cameraController!),
                          ),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
          ),
          // Tombol di bagian bawah
          Container(
            // color: Colors.black,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               const TumpangAirResult(accuracy: 80.0)));
                  // },
                  onTap: _uploadImage,
                  child: Container(
                    child: Column(children: <Widget>[
                      Image.asset(
                        "assets/images/find.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.classification,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: _takePhoto,
                  child: Container(
                    child: Column(children: <Widget>[
                      Image.asset(
                        "assets/images/snap.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.camera,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    child: Column(children: <Widget>[
                      Image.asset(
                        "assets/images/upload.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        AppLocalizations.of(context)!.upload,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
