import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

class CameraKTP extends StatefulWidget {
  const CameraKTP({super.key});

  @override
  State<CameraKTP> createState() => _CameraKTPState();
}

class _CameraKTPState extends State<CameraKTP> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize().then((_) {
      // Add a setState call here to trigger a rebuild
      if (mounted) {
        setState(() {});
      }
    }).catchError((error) {
      print('Error initializing camera: $error');
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          print(snapshot.connectionState == ConnectionState.done);
          if (snapshot.connectionState == ConnectionState.done) {
            // Check if the CameraController has been initialized
            if (!_controller.value.isInitialized) {
              return Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: <Widget>[
                CameraPreview(_controller),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 40.0),  // Add vertical spacing
                      child: Image.asset(
                        'assets/images/ktp-placeholder.png',  // Replace with your placeholder image path
                        width: MediaQuery.of(context).size.width * 0.9,  // Make the image larger in width
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // While the camera is still initializing, show a loading spinner
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF6366F1),
              backgroundColor: Color(0xFF6366F1) // This is the button color
            ),
            child: Icon(Icons.camera, color: Colors.white,),
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final XFile? imageFile = await _controller.takePicture();
                if (imageFile != null) {
                  Navigator.pop(context, imageFile.path);
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ),
    );
  }
}
