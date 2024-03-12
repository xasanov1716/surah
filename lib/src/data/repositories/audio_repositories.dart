import 'package:flutter/material.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/data/models/audio_model_sql.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  late AudioPlayer audioPlayer;


  AudioPlayerService() {
    audioPlayer = AudioPlayer();
  }



  Future<void> initAudioPlayer({required String url}) async {
    try {
      await audioPlayer.setUrl('https://archive.org/details/best-quran-recitations-mp3-download-latest');
      await audioPlayer.load();
      Utils.isPlaying = true;
      play();
    } catch (e) {
      debugPrint('Error initializing audio player: $e');
    }
  }


  Future<void> _initFileAudioPlayer(List<QuranModelSql> audioSources,int index) async {
    try {

      await audioPlayer.setFilePath(audioSources[index].audio);
      await audioPlayer.load();
      play();
    } catch (e) {
      debugPrint('Error initializing audio player: $e');
    }
  }


   Future<void> play() async {
    await audioPlayer.play();
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    Utils.isPlaying = false;
  }

  Future<void> next(List<QuranModel> audioSources,int index) async {
    debugPrint('Index $index');
    if (index < audioSources.length - 1) {
      index++;
      Utils.surahIndex = index;
    } else {
      index = 0;
      Utils.surahIndex = index;
    }
    Utils.index = index;
    await audioPlayer.setUrl(audioSources[Utils.surahIndex].audio!);
    await audioPlayer.load();
    await play();
  }

  Future<void> previous(List<QuranModel> audioSources,int index) async {
    if (index > 0) {
      index--;
      Utils.surahIndex = index;
    } else {
      index = 0;
      Utils.surahIndex = index;
    }
    Utils.index = index;
    await audioPlayer.setUrl(audioSources[Utils.surahIndex].audio!);
    await audioPlayer.load();
    await play();
  }

  Future<void> shuffle(List<QuranModel> audioSources) async {
    audioPlayer.shuffle();
    audioPlayer.shuffleModeEnabledStream;
    await audioPlayer.setUrl(audioSources[Utils.surahIndex].audio!);
    await audioPlayer.load();
    await play();
    Utils.isShuffle = true;
  }

  Future<void> noShuffle()async{
    Utils.isShuffle = false;
}

  Future<void> seek(Duration position) async {
    await audioPlayer.seek(position);
  }

  Stream<Duration?> get durationStream => audioPlayer.durationStream;

  Stream<Duration?> get positionStream => audioPlayer.positionStream;

   Duration? get duration => audioPlayer.duration;
   Duration get position => audioPlayer.position;


  void dispose() {
    audioPlayer.dispose();
  }
}

enum PlayerState { playing, paused, stopped }
