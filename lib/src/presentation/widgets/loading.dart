import 'package:flutter/material.dart';
import 'package:surah/src/config/constant/app_constants.dart';

import '../../config/utils/utils.dart';


void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child:  Center(
            child: SizedBox(
              height: 70.0 * height / figmaHeight,
              width: 70.0 * width / figmaWidth,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext? context}) async {
  if (context != null) Navigator.pop(context);
}