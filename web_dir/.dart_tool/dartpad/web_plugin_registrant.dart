// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:assets_audio_player_web/web/assets_audio_player_web.dart';
import 'package:audio_service_web/audio_service_web.dart';
import 'package:audio_session/audio_session_web.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AssetsAudioPlayerWebPlugin.registerWith(registrar);
  AudioServiceWeb.registerWith(registrar);
  AudioSessionWeb.registerWith(registrar);
  JustAudioPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
