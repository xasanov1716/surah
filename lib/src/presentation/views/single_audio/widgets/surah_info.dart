import 'package:flutter/material.dart';
import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/presentation/widgets/media_item.dart';

class SurahInfo extends StatelessWidget {
  const SurahInfo({super.key, required this.quranModel});

  final QuranModel quranModel;


  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: MediaItem(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                baseImage,
                height: 300 * height / figmaHeight,
                width: 300 * width / figmaWidth,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quranModel.nameLat!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        quranModel.author!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
