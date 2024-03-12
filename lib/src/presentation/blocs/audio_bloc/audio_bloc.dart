
import 'package:flutter/cupertino.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/data/repositories/audio_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audio_event.dart';
part 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayerService audioPlayer;
  AudioBloc(this.audioPlayer) : super(AudioState(currentPosition: 0, maxDuration: 0, isPlaying: Utils.isPlaying, isShuffle: Utils.isShuffle)) {

    //Play Audio Event
    on<PlayAudioEvent>((event, emit){
      audioPlayer.initAudioPlayer(url: event.audioUrl);
     emit( AudioState(currentPosition: 0, maxDuration: 0,isPlaying: Utils.isPlaying,isShuffle: false));
    });

    on<NoShuffleEvent>((event, emit){
      audioPlayer.noShuffle();
      emit(AudioState(currentPosition: 0, maxDuration: 0, isPlaying: Utils.isPlaying, isShuffle: Utils.isShuffle));
    });


    //Pause Audio Event
    on<PauseAudioEvent>((event, emit) {
      audioPlayer.pause();
      emit(AudioState(currentPosition: 0, maxDuration: 0, isPlaying: false, isShuffle: Utils.isShuffle));
    });


    //Next Audio Event
    on<NextAudioEvent>((event, emit) {
        audioPlayer.next(event.audioFiles,event.index);

    });


    //Previous Audio Event
    on<PreviousAudioEvent>((event, emit) {
        audioPlayer.previous(event.audioFiles, event.index);
        emit(AudioState(currentPosition: 0, maxDuration: 0, isPlaying: Utils.isPlaying, isShuffle: Utils.isShuffle));
    });


    //Shuffle Audio Event
    on<ShuffleAudioEvent>((event, emit) {
      audioPlayer.shuffle(event.audioFiles);
        emit(AudioState(currentPosition: 0, maxDuration: 0, isPlaying: Utils.isPlaying, isShuffle: Utils.isShuffle));
    });


  }
}
