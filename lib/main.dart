import 'dart:developer';
import 'dart:ui_web';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player_web/assets_audio_player_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  //final JustAudioPlayer audioPlayer; 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        
      ),
      body: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed:() async {
              log("Playback started");
              try {
                await assetsAudioPlayer.open(
                  Audio("assets/audio/Vivid.mp3"),
                  showNotification: true,
                );
                assetsAudioPlayer.play();
              } catch (e) {
                log(e.toString());
              }
            }, icon: Icon(Icons.play_arrow)),
          IconButton(onPressed:() async {
              log("Playback stopped");
              await assetsAudioPlayer.stop();
            }, icon: Icon(Icons.pause)),
        ],
      ),)
    );
  }
}
