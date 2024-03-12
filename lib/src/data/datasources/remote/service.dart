

import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/data/models/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {

  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    init();
  }

  init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint('On Error: ${error.message}');

          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint('On Request: ${requestOptions.data}');
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint('On Response: ${response.statusCode}');
          debugPrint('PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
      ),
    );
  }


  Future<UniversalResponse> getAllSurah() async {
    Response response;
    try {
      response = await _dio.get('/api/surah');
      debugPrint('RESPONSE DATA: ${response.data}');
      debugPrint('STATUS MESSAGE ${response.statusMessage!}');
      debugPrint(response.statusCode.toString());
      debugPrint('RUNTIME TYPE : ${response.data.runtimeType}');
      if (response.statusCode == 200) {
        return UniversalResponse(data: (response.data as List?)
            ?.map((e) => QuranModel.fromJson(e))
            .toList() ?? [],
        );
      } else {
        return UniversalResponse(data: (response.data as List?)
        ?.map((e) => QuranModel.fromJson(e))
        .toList() ?? [],
    );
      }
    }
    catch (e) {
      debugPrint('Catch Error $e');
      return UniversalResponse(error: e.toString());
    }
  }

}
