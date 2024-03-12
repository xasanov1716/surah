part of 'audio_bloc.dart';

@immutable

class AudioState {
  final int currentPosition;
  final int maxDuration;
  final bool isPlaying;
  final bool isShuffle;

  const AudioState(
      {required this.currentPosition,
      required this.maxDuration,
      required this.isPlaying,
      required this.isShuffle});
}

