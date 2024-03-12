import 'package:flutter/material.dart';
import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/config/utils/utils.dart';

import '../../../widgets/media_item.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({super.key, required this.onPrevious, required this.onPlay, required this.onNext});

  final VoidCallback onPrevious;
  final VoidCallback onPlay;
  final VoidCallback onNext;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPrevious,
            child:  MediaItem(
                child: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 32 * height / figmaHeight,
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: onPlay,
              child: MediaItem(
                  child: Icon(
                    Utils.isPlaying ? Icons.play_arrow : Icons.pause,
                    color: Colors.white,
                    size: 32,
                  )),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onNext,
            child: const MediaItem(
                child: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 32,
                )),
          ),
        ),
      ],
    );
  }
}
