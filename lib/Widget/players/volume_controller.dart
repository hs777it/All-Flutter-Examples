import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VolumeControllerScreen(),
    );
  }
}

class VolumeControllerScreen extends StatefulWidget {
  const VolumeControllerScreen({super.key});

  @override
  State<VolumeControllerScreen> createState() => _VolumeControllerScreenState();
}

class _VolumeControllerScreenState extends State<VolumeControllerScreen> {
// set volume value of device
  double setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    // To get current device volume
    FlutterVolumeController.getVolume().then((volume) => setVolumeValue = volume ?? 0.0);
    // Listen to system volume change
    FlutterVolumeController.addListener((volume) {
      setState(() =>
          // set is value in listener value
          setVolumeValue = volume);
    });
  }

// Dispose the listener we have created
  @override
  void dispose() {
    FlutterVolumeController.removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume Controller'), centerTitle: true),
      body: Column(
        children: [
          // To check current volume with 2 values after decimal
          Text('Current volume: ${setVolumeValue.toStringAsFixed(2)}'),
          // Set Volume from slider in app
          Row(
            children: [
              const Text('Set Volume:'),
              Flexible(
                child: Slider(
                  min: 0,
                  max: 1,
                  // divisions: 20,
                  onChanged: (double value) {
                    setVolumeValue = value;
                    FlutterVolumeController.setVolume(setVolumeValue);
                    // FlutterVolumeController.showSystemUI;
                    setState(() {});
                  },
                  value: setVolumeValue,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mute the volume of device
              ElevatedButton(
                onPressed: () => FlutterVolumeController.getMute(),
                child: const Text('Mute Volume'),
              ),
              const SizedBox(width: 10),
              // Set the volume as its maximum
              ElevatedButton(
                onPressed: () => FlutterVolumeController.raiseVolume(1),
                child: const Text('Max Volume'),
              ),
            ],
          ),
          // This is to select whether we have to show System UI or not
          SwitchListTile.adaptive(
              title: const Text('Show system UI'),
              value: FlutterVolumeController.showSystemUI,
              onChanged: (val) async {
                // Change the state of volume controller
                await FlutterVolumeController.updateShowSystemUI(val);
                setState(() {});
              })
        ],
      ),
    );
  }
}
