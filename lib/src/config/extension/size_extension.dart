import 'package:flutter/cupertino.dart';
import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/config/utils/utils.dart';

extension Space on num {
  SizedBox get ph => SizedBox(height: toDouble() * height / figmaHeight);
  SizedBox get pw => SizedBox(width: toDouble() * width / figmaWidth);
}