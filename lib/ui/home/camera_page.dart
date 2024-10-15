import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<CameraDescription> _cameras = [];
  bool _isFrontCamera = true;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _controller = CameraController(
        _isFrontCamera ? _cameras[1] : _cameras[0], // Front or back camera
        ResolutionPreset.high,
      );
      _initializeControllerFuture = _controller.initialize();
      setState(() {});
    } else {
      print('No cameras available');
    }
  }

  void _toggleCamera() async {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
    });
    _initializeCameras();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final XFile image = await _controller.takePicture();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picture saved to ${image.path}')),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1D9D4),
      body: _cameras.isEmpty
          ? const Center(child: Text('No cameras found'))
          : FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // Camera preview container with reduced top spacing
                Positioned(
                  top: MediaQuery.of(context)
                      .padding
                      .top, // Close to appbar
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height *
                        0.72, // Taller camera preview
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50), // Rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // Same corner radius
                      child: CameraPreview(
                          _controller), // Display camera preview
                    ),
                  ),
                ),
                // Flash icon button
                Positioned(
                  top: 10,
                  right: 30,
                  child: Container(
                    width: 55,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.flash_on_outlined,
                          color: Color(0xFFC68988), size: 25),
                      onPressed: () {
                        // Handle flash toggle
                      },
                    ),
                  ),
                ),
                // Capture button at the bottom
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width / 2 - 35,
                  child: GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white, // Pink capture button
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color(0xFFC68988), width: 4),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFFC68988),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                    width: 23,
                                    height: 23,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFC68988),
                                      shape: BoxShape.circle,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
