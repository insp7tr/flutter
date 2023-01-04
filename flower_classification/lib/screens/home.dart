import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_final_fields
  bool _loading = true;
  File? _image;
  List? _output;

  final picker = ImagePicker();

  Future<void> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output;
      _loading = false;
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/labels.txt',
    );
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image!);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image!);
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.004,
              1,
            ],
            colors: [
              Color(0xFFA8E063),
              Color(0xFF56AB2F),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Detect Flowers",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: _loading
                          ? SizedBox(
                              width: 300,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/splash.png",
                                    height: 250,
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 250,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(_image!),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _output != null
                                    ? Text(
                                        'Prediction is: ${_output![0]['label']}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )
                                    : Container(),
                                const SizedBox(height: 10),
                              ],
                            ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => pickImage(),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 180,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 17,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF56AB2F),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "Take a photo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => pickGalleryImage(),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 180,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 17,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF56AB2F),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                "Camera roll",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
