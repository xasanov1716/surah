import 'dart:async';
import 'dart:io';

import 'package:surah/src/data/models/audio_model_sql.dart';
import 'package:surah/src/presentation/blocs/save_surah_bloc/save_surah_bloc.dart';
import 'package:surah/src/presentation/cubits/download_cubit/downloader_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownLoaderCubit extends Cubit<DownLoaderState> {
  DownLoaderCubit()
      : super(
    const DownLoaderState(
      progress: 0.0,
      newFileLocation: "",
    ),
  );

  myProgressEmitter(double pr) {
    emit(state.copyWith(progress: pr));
  }

  downloadFile(
      {required String fileInfo, required BuildContext context , required QuranModelSql quranModelSql}) async {
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;
    Dio dio = Dio();

    var directory = await getDownloadPath();
    String newFileLocation =
        "${directory?.path}/Audio${fileInfo.substring(fileInfo.length - 5, fileInfo.length)}";
    var allFiles = directory?.list();

    debugPrint(newFileLocation);
    List<String> filePaths = [];
    await allFiles?.forEach((element) {
      filePaths.add(element.path.toString());
    });
    if (filePaths.contains(newFileLocation) && context.mounted) {
       Navigator.pop(context);
       quranModelSql.copyWith(audio: newFileLocation);
       context.read<SaveQuranBloc>().add(QuranInsertEvent(quranModelSql: quranModelSql));
    } else {
      try {
        await dio.download(
          fileInfo,
          newFileLocation,
          onReceiveProgress: (count, total) {
            myProgressEmitter(count / total);
            if (count / total == 1.0) {
              emit(state.copyWith(newFileLocation: newFileLocation,progress: count / total));
            }
          },
        );
        if(context.mounted) Navigator.pop(context);
      } catch (error) {
        debugPrint("DOWNLOAD ERROR:$error");
        if (context.mounted) debugPrint('Error');
      }
    }
  }


  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path : $err");
    }
    return directory;
  }
}