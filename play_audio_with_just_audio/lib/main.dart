import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late just_audio.AudioPlayer _audioPlayer;
  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  @override
  void dispose() {
    _releasePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Audio"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () async {
              await _playAudio();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: Center(
                        child: Text("Audio Play.. "),
                      ),
                    ),
                  ));
            },
            child: Text("Play")),
      ),
    );
  }

  Future<void> _playAudio() async {
    try {
      // Loading audio
      await _audioPlayer.setAsset("assets/fomo.mp3");
      // Playing the audio
      await _audioPlayer.play();

      // Stop Audio and disposing it
      await _audioPlayer.stop();
    } catch (e) {
      // Handle any exceptions
      print('Error playing audio: $e');
    }
  }

  Future<void> _initPlayer() async {
    _audioPlayer = just_audio.AudioPlayer();
  }

  Future<void> _releasePlayer() async {
    await _audioPlayer.dispose();
  }
}
