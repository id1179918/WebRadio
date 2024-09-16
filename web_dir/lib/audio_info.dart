//Create a audio/song model that reproduce's the different streaming
//platforms' embedded code format in order to stream music directly
//from platform so the artists still get royalties

import 'dart:web_gl';

class AudioInfo {
  int? id;
  String? song_title;
  String? album_title;
  String? song_release_date;
  String? artist_name;
  Buffer? audio;
  AudioInfo({
    id = 0,
    title = "",
  });
}
