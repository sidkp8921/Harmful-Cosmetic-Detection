import 'dart:io';

import 'package:cosmetic/fifthscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? pickedImage;

  Future<void> _processImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final inputImage = InputImage.fromFilePath(imageFile.path);

      final textDetector = GoogleMlKit.vision.textRecognizer();
      final RecognizedText recognisedText =
          await textDetector.processImage(inputImage);

      final recognizedText = recognisedText.text;

      textDetector.close();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FifthScreen(text: recognizedText),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Recognition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _processImage(ImageSource.camera);
              },
              child: Text('Pick Image from Camera'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await _processImage(ImageSource.gallery);
            //   },
            //   child: Text('Take Image from Gallery'),
            // ),
          ],
        ),
      ),
    );
  }
}
