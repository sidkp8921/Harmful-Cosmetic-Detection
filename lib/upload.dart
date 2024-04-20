// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';

// import 'fifthscreen.dart';
// import 'sixthScreen.dart';

// class UploadPage extends StatefulWidget {
//   String formatText(String text) {
//     List<String> harmfulIngredients = [
//       'excellence',
//       'Diethanolamine',
//       'Fragrance',
//       'Latex',
//       'Parabens'
//     ]; // Define harmful ingredients
//     List<String> words = text.split(' ').map((word) => word.trim()).toList();
//     List<String> lines = [];
//     String line = '';

//     for (String word in words) {
//       if ((line + ' ' + word).length > 20) {
//         lines.add(line.trim());
//         line = '';
//       }
//       line += (line.isNotEmpty ? ', ' : '') + word;
//     }
//     lines.add(line.trim()); // Add the last line

//     // Check for harmful ingredients
//     List<String> detectedIngredients = [];
//     for (String ingredient in harmfulIngredients) {
//       if (text.contains(ingredient)) {
//         detectedIngredients.add(ingredient);
//       }
//     }

//     if (detectedIngredients.isNotEmpty) {
//       lines.add(
//           'Harmful ingredients detected: ${detectedIngredients.join(", ")}');
//     } else {
//       lines.add('Not harmful!');
//     }

//     return lines.join('\n');
//   }

//   const UploadPage({Key? key}) : super(key: key);

//   @override
//   State<UploadPage> createState() => _UploadPageState();
// }

// class _UploadPageState extends State<UploadPage> {
//   File? selectedMedia;
//   List<String> words = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Text Recognition"),
//       ),
//       body: _buildUI(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           _pickImage(ImageSource.gallery);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildUI() {
//     return ListView(
//       children: [
//         _imageView(),
//         _extractTextView(),
//       ],
//     );
//   }

//   Widget _imageView() {
//     if (selectedMedia == null) {
//       return const Center(
//         child: Text("Pick an image for text recognition."),
//       );
//     }
//     return Center(
//       child: Image.file(
//         selectedMedia!,
//         width: 200,
//       ),
//     );
//   }

//   Widget _extractTextView() {
//     if (selectedMedia == null) {
//       return const Center(
//         child: Text("No result."),
//       );
//     }
//     return FutureBuilder<String>(
//       future: _extractText(selectedMedia!),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else {
//           return Text(
//             snapshot.data ?? "",
//             style: const TextStyle(
//               fontSize: 25,
//             ),
//           );
//         }
//       },
//     );
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: source);

//     if (pickedImage == null) return;

//     final imageFile = File(pickedImage.path);
//     setState(() {
//       selectedMedia = imageFile;
//     });
//   }

//   Future<String> _extractText(File file) async {
//     final textDetector = GoogleMlKit.vision.textRecognizer();
//     final inputImage = InputImage.fromFilePath(file.path);
//     final RecognizedText recognisedText =
//         await textDetector.processImage(inputImage);

//     String text = recognisedText.text;
//     List<String> words = text.split(' ');
//     bool containsWord(List<String> words, String word) {
//       return words.contains(word);
//     }

//     String wordToCheck = "PARABENS";
//     if (containsWord(words, wordToCheck)) {
//       snackBar("Harmful substance");
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => FifthScreen(text: text)),
//       );
//     } else {
//       snackBar("Good");
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SixthScreen()),
//       );
//     }

//     return text;
//   }

//   void snackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: const Duration(seconds: 3),
//         action: SnackBarAction(
//           label: 'OK',
//           onPressed: () {},
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     GoogleMlKit.vision.textRecognizer();
//     super.dispose();
//   }
// }
import 'dart:io';

import 'package:cosmetic/sixthScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class Uploadpage extends StatefulWidget {
  @override
  State<Uploadpage> createState() => _UploadpageState();
}

class _UploadpageState extends State<Uploadpage> {
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
          builder: (context) => SixthScreen(text: recognizedText),
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
            // ElevatedButton(
            //   onPressed: () async {
            //     await _processImage(ImageSource.camera);
            //   },
            //   child: Text('Pick Image from Camera'),
            // ),
            ElevatedButton(
              onPressed: () async {
                await _processImage(ImageSource.gallery);
              },
              child: Text('Take Image from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
