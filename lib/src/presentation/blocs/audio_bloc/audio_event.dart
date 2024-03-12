part of 'audio_bloc.dart';

@immutable
abstract class AudioEvent {}

class NextAudioEvent extends AudioEvent {
  final List<QuranModel> audioFiles;
  final int index;
  NextAudioEvent({required this.audioFiles,required this.index});
}

class PreviousAudioEvent extends AudioEvent {
  final List<QuranModel> audioFiles;
  final int index;

  PreviousAudioEvent({required this.index, required this.audioFiles});
}


class PlayAudioEvent extends AudioEvent {
  final String audioUrl;

  PlayAudioEvent({required this.audioUrl});
}

class AudioSeekEvent extends AudioEvent{
  final Duration duration;

  AudioSeekEvent({required this.duration});
}

class NoShuffleEvent extends AudioEvent {}

class PauseAudioEvent extends AudioEvent {}

class ShuffleAudioEvent extends AudioEvent {
  final List<QuranModel> audioFiles;

  ShuffleAudioEvent({required this.audioFiles});
}

