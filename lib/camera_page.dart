import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:leaves_classification_application/result_page.dart';

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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Foto berhasil diambil: ${photo.path}')),
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
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: _isCameraInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CameraPreview(_cameraController!),
                  )
                : const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultPage()));
                  },
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
                        'Klasifikasi',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                        'Kamera',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
                        'Unggah\nGambar',
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
