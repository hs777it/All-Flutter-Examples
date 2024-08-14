import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // ^0.9.35
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart'; //^2.0.1

class JustAudio extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const JustAudio(this.audioUrl,
      {this.speed = false,
      this.volume = false,
      this.kSecondryColor = const Color(0xff305F72),
      this.kMainColor = const Color(0xFF1CB5F1),
      this.kBlueGrey = const Color(0xFF607D8B)});

  final String audioUrl;
  final bool speed, volume;

  final Color kMainColor;
  final Color kSecondryColor;
  final Color kBlueGrey;

  @override
  State<JustAudio> createState() => _JustAudioState();
}

class _JustAudioState extends State<JustAudio> {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _setupAudioPlayer(widget.audioUrl);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: Padding(padding: const EdgeInsets.only(top: 18), child: _progessBar()),
              ),
              _playbackControlButton(widget.kSecondryColor),
            ]),
            Row(
              children: [
                _controlButtons(),
              ],
            )
          ]),
    );
  }

  Future<void> _setupAudioPlayer(String url) async {
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stacktrace) {
      if (kDebugMode) {
        print("A stream error occurred: $e");
      }
    });
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    } catch (e) {
      if (kDebugMode) {
        print("Error loading audio source: $e");
      }
    }
  }

  Widget _progessBar() {
    return StreamBuilder<Duration?>(
      stream: _player.positionStream,
      builder: (context, snapshot) {
        return ProgressBar(
          baseBarColor: widget.kSecondryColor, //Color(0xff305F72)
          progressBarColor: widget.kMainColor, //Color(0xFF1CB5F1)
          bufferedBarColor: widget.kMainColor, //Color(0xFF1CB5F1)
          thumbColor: widget.kBlueGrey, // Color(0xFF607D8B)
          progress: snapshot.data ?? Duration.zero,
          buffered: _player.bufferedPosition,
          total: _player.duration ?? Duration.zero,
          onSeek: (duration) {
            _player.seek(duration);
          },
        );
      },
    );
  }

  Widget _playbackControlButton(Color progressIndicatorColor) {
    return StreamBuilder<PlayerState>(
        stream: _player.playerStateStream,
        builder: (context, snapshot) {
          final processingState = snapshot.data?.processingState;
          final playing = snapshot.data?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                color: progressIndicatorColor,
              ),
            );
          } else if (playing != true) {
            return customButton(const Icon(Icons.play_arrow), _player.play);
          } else if (processingState != ProcessingState.completed) {
            return customButton(const Icon(Icons.pause), _player.pause);
          } else {
            return customButton(const Icon(Icons.replay), () => _player.seek(Duration.zero));
          }
        });
  }

  Widget _controlButtons() {
    return Expanded(
      child: Column(children: [
        StreamBuilder(
            stream: _player.speedStream,
            builder: (context, snapshot) {
              if (widget.speed) {
                return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text('سرعة الصوت'),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.speed),
                  Flexible(
                    child: Slider(
                        min: 1,
                        max: 2,
                        thumbColor: widget.kMainColor,
                        activeColor: widget.kMainColor,
                        inactiveColor: widget.kSecondryColor,
                        secondaryActiveColor: widget.kSecondryColor,
                        value: snapshot.data ?? 1,
                        divisions: 5,
                        onChanged: (value) async {
                          await _player.setSpeed(value);
                        }),
                  )
                ]);
              } else {
                return const SizedBox();
              }
            }),
        StreamBuilder(
            stream: _player.volumeStream,
            builder: (context, snapshot) {
              if (widget.volume) {
                return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('مستوى الصوت'),
                  const SizedBox(width: 10),
                  const Icon(Icons.volume_up),
                  Flexible(
                    child: Slider(
                        min: 0,
                        max: 1,
                        thumbColor: widget.kMainColor,
                        activeColor: widget.kMainColor,
                        inactiveColor: widget.kSecondryColor,
                        secondaryActiveColor: widget.kSecondryColor,
                        value: snapshot.data ?? 1,
                        divisions: 7,
                        onChanged: (value) async {
                          await _player.setVolume(value);
                        }),
                  )
                ]);
              } else {
                return const SizedBox();
              }
            }),
      ]),
    );
  }

  customButton(Widget icon, void Function()? func) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blue.shade300,
        ),
        shape: BoxShape.circle,
        //color: Colors.yellow,
      ),
      child: IconButton(
        icon: icon,
        iconSize: 32,
        onPressed: func,
      ),
    );
  }
}
