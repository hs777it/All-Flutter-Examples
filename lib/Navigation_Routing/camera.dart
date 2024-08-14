import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CameraAccess(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CameraAccess extends StatefulWidget {
  const CameraAccess({super.key});

  @override
  State<StatefulWidget> createState() {
    return CameraAccessState();
  }
}

class CameraAccessState extends State<CameraAccess> {
  late XFile? cameraFile;

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    final ImagePicker picker = ImagePicker();
    selectFromCamera() async {
      cameraFile = await picker.pickImage(
        source: ImageSource.camera,
      );
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera Access"),
        backgroundColor: Colors.green,
        actions: const [
          Text(
            "GFG",
          )
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: selectFromCamera,
                    child: const Text('Select Image from Camera')),
                SizedBox(
                  height: 200.0,
                  width: 300.0,
                  // ignore: unnecessary_null_comparison
                  child: cameraFile == null
                      ? const Center(child: Text('Sorry nothing selected!!'))
                      : Center(child: Image.file(File(cameraFile!.path))),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
