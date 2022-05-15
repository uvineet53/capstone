import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer player = AudioPlayer();
  String url = "assets/sound1.wav";
  var duration;
  play() async {
    duration = await player.setAsset(url, preload: true);
  }

  @override
  void initState() {
    play();
    super.initState();
  }

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Enter SOS Contacts")),
          ElevatedButton(onPressed: () {}, child: Text("Customise Sound")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isPlaying = !isPlaying;
          });
          if (isPlaying) {
            await player.play();
          } else {
            await player.stop();
          }
        },
        child: Icon(Icons.sos_rounded),
      ),
    );
  }
}
