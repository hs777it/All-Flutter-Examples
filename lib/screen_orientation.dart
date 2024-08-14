import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //       DeviceOrientation.portraitUp,
    //       DeviceOrientation.portraitDown,
    //     ]);

    return MaterialApp(
      title: 'Toggle Screen Orientation',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ChangeScreenOrientation(),
    );
  }
}

class ChangeScreenOrientation extends StatelessWidget {
  const ChangeScreenOrientation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GFG - Toggle Screen Orientation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.landscapeLeft]);
            } else {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            }
          },
          child: const Text('Toggle Orientation'),
        ),
      ),
    );
  }
}
