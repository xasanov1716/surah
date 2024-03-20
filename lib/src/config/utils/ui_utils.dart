import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surah/src/data/models/audio_model_sql.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/presentation/blocs/save_surah_bloc/save_surah_bloc.dart';
import 'package:surah/src/presentation/cubits/download_cubit/download_cubit.dart';
import 'package:surah/src/presentation/cubits/download_cubit/downloader_state.dart';

void showMyDialog(BuildContext context, QuranModel audioFiles) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocConsumer<DownLoaderCubit, DownLoaderState>(
          listener: (context, state) {
            if (state is DownLoaderState) {}
          },
          builder: (context, state) {
            return AlertDialog(
              title: Column(
                children: [
                  const SizedBox(height: 7),
                  ListTile(
                    onTap: () {
                      context.read<DownLoaderCubit>().downloadFile(
                          fileInfo: audioFiles.audio!,
                          quranModelSql: QuranModelSql(
                              name: audioFiles.name!,
                              author: audioFiles.author!,
                              number: audioFiles.number!,
                              nameLat: audioFiles.nameLat!,
                              description: audioFiles.description!,
                              audio: audioFiles.audio!,
                              countAyah: audioFiles.countAyah!,
                              createLocation: audioFiles.createLocation!),
                          context: context);
                      context.read<SaveQuranBloc>().add(QuranInsertEvent(
                          quranModelSql: QuranModelSql(
                              name: audioFiles.name!,
                              author: audioFiles.author!,
                              number: audioFiles.number!,
                              nameLat: audioFiles.nameLat!,
                              description: audioFiles.description!,
                              audio: audioFiles.audio!,
                              countAyah: audioFiles.countAyah!,
                              createLocation: audioFiles.createLocation!)));
                    },
                    leading: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: SizedBox(
                        height: 45,
                        width: 45,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: Visibility(
                                  visible: state.progress != 1.0,
                                  child: CircularProgressIndicator(
                                    value: state.progress,
                                    color: Colors.white,
                                    backgroundColor: Colors.blue,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child:
                                  state.progress != 1.0 && state.progress == 0.0
                                      ? const Icon(
                                          Icons.arrow_downward_rounded,
                                          color: Colors.white,
                                          size: 22,
                                        )
                                      : state.progress != 1.0 &&
                                              state.progress != 0.0
                                          ? Text(
                                              "${(state.progress * 100).toInt()}%",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                          : const Icon(
                                              Icons.description,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: Text(
                      "${state.progress * 100}%",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
}
