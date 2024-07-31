import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui_web';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player_web/assets_audio_player_web.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Instance of the audio player class
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
                // Issuing HTTP request to server
                http.Response res = await http.get(Uri.parse("http://192.168.0.173:3001/api/data"));

                log(res.body.toString());

                if (res.statusCode == 200) {
                  //  await assetsAudioPlayer.open(
                  //    Audio("assets/audio/Vivid.mp3"),
                  //    showNotification: true,
                  //  );
                  //  assetsAudioPlayer.play();
                }
              } catch (e) {
                log(e.toString());
              }
            }, icon: Icon(Icons.play_arrow)),
          IconButton(onPressed:() async {
              log("Playback stopped");
              if (assetsAudioPlayer.isPlaying.value) {
                await assetsAudioPlayer.stop();
              }
            }, icon: Icon(Icons.pause)),
        ],
      ),)
    );
  }
}
