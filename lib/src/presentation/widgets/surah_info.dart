import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/presentation/widgets/media_item.dart';

import '../../data/models/quran_model.dart';


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
                child: CachedNetworkImage(
                  imageUrl: baseImage,
                  height: 300 * height / figmaHeight,
                  width: 300 * width / figmaWidth,
                  fit: BoxFit.fill,
                  placeholder: (context, url)=> const Center(child: CupertinoActivityIndicator(),),
                  errorWidget: (context, url,error)=>const Icon(Icons.error,color: Colors.red,),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suraName[Utils.index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        quranModel.audio!
                            .split('/')[4]
                            .replaceAll('_', ' '),
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
