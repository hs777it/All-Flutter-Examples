import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  runApp(const WakelockExampleApp());
}

class WakelockExampleApp extends StatefulWidget {
  const WakelockExampleApp({super.key});

  @override
  State<WakelockExampleApp> createState() => _WakelockExampleAppState();
}

class _WakelockExampleAppState extends State<WakelockExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GeeksForGeeks'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Spacer(
                flex: 3,
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    Wakelock.enable();
                  });
                },
                child: const Text('enable wakelock'),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    Wakelock.disable();
                  });
                },
                child: const Text('disable wakelock'),
              ),
              const Spacer(
                flex: 2,
              ),
              FutureBuilder(
                future: Wakelock.enabled,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return Text('The wakelock is currently '
                        '${snapshot.data! ? 'enabled' : 'disabled'}.');
                  } else {
                    return Container();
                  }
                },
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
