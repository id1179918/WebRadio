import 'dart:developer';

import 'package:just_audio_background/just_audio_background.dart';
import 'package:local/music_player.dart';
import 'package:just_audio/just_audio.dart';



class JustAudioPlayer implements MusicPlayback {
 final AudioPlayer _player = AudioPlayer();

 @override
 Future<void> init() async {
    await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
 }

 @override
 Future<Duration> load(String url) async {
  Uri uri;
  try {
    uri = Uri.parse(url);
  } catch (e) {
    throw e;
  }
  if (uri == null) {
    return Duration.zero;
  }
  try {
   final source = AudioSource.uri(
     uri,
     tag: const MediaItem(
       id: "1",
       title: "My song",
     ),
   );
   try {
     Duration? time = await _player.setAudioSource(source).catchError((e) {log("setAudioSource error:"+e.toString());});
     return time!;
   } catch (e) {
      log("Error type:"+e.runtimeType.toString());
      throw e;
   }
   return Duration.zero;
  } catch (e) {
    log(e.toString());
    return Duration.zero;
  }
 }

  @override
  Future<void> setAsset(String path) async {
    try {
      await _player.setAsset(path);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> setUrl(String path) async {
    try {
      _player.setUrl(path);
    } catch (e) {
      throw e;
    }
  }

 @override
 void play() => _player.play();

 @override
 void pause() => _player.pause();

 @override
 void seek(Duration position) => _player.seek(position);

 @override
 Stream<Duration> get position => _player.positionStream;

 @override
 Stream<Duration> get totalDuration => _player.durationStream.map(
       (duration) => duration ?? Duration.zero,
     );

 @override
 Future<void> dispose() async => await _player.dispose();
}
