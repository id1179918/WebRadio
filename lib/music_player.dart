abstract class MusicPlayback {
 Future<void> init();
 Future<void> load(String url);
 Future<void> setAsset(String path);
 Future<void> setUrl(String path);
 void play();
 void pause();
 void seek(Duration position);
 Stream<Duration> get position;
 Stream<Duration> get totalDuration;
 Future<void> dispose();
}