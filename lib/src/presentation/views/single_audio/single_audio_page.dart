import 'package:surah/src/config/extension/size_extension.dart';
import 'package:surah/src/config/utils/ui_utils.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/presentation/blocs/audio_bloc/audio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surah/src/presentation/views/single_audio/widgets/surah_item.dart';

class SingleAudioPage extends StatefulWidget {
  const SingleAudioPage({Key? key, required this.audioFiles}) : super(key: key);

  final List<QuranModel> audioFiles;

  @override
  State<SingleAudioPage> createState() => _SingleAudioPageState();
}

class _SingleAudioPageState extends State<SingleAudioPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('P L A Y L I S T'),
        actions: [
          IconButton(
              onPressed: () {
                showMyDialog(context, widget.audioFiles[Utils.surahIndex]);
              },
              icon: const Icon(Icons.download))
        ],
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<AudioBloc, AudioState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                // cover art, artist name, song name
                10.ph,
                // start time, shuffle button, repeat button, end time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        state.isShuffle
                            ? context.read<AudioBloc>().add(ShuffleAudioEvent(
                                audioFiles: widget.audioFiles))
                            : NoShuffleEvent();
                        setState(() {});
                      },
                      child: Icon(
                        !state.isShuffle
                            ? Icons.shuffle
                            : Icons.double_arrow_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.repeat,
                      color: Colors.white,
                    ),
                    const Text('4:22', style: TextStyle(color: Colors.white))
                  ],
                ),

                30.ph,

                // linear bar

                30.ph,
                // previous song, pause play, skip next song
                SurahItem(onPrevious: () {
                  context.read<AudioBloc>().add(PreviousAudioEvent(
                      index: Utils.surahIndex, audioFiles: widget.audioFiles));
                  setState(() {});
                }, onPlay: () {
                  context.read<AudioBloc>().add(state.isPlaying
                      ? PauseAudioEvent()
                      : PlayAudioEvent(
                          audioUrl:
                              widget.audioFiles[Utils.surahIndex].audio!));
                }, onNext: () {
                  context.read<AudioBloc>().add(NextAudioEvent(
                      audioFiles: widget.audioFiles, index: Utils.surahIndex));
                  setState(() {});
                }),
                12.ph
              ],
            ),
          );
        },
      ),
    );
  }
}
