import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/presentation/views/all_audio/all_audio_page.dart';
import 'package:surah/src/presentation/views/home/home_page.dart';
import 'package:surah/src/presentation/views/saved/saved_page.dart';
import 'package:surah/src/presentation/views/single_audio/single_audio_page.dart';
import 'package:surah/src/presentation/views/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const allAudio = '/allAudio';
  static const singleAudio = '/singleAudio';
  static const saved = '/saved';

}


class AppRoutes {
  static Route generateRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.singleAudio:
        return CupertinoPageRoute(builder: (context){
          var a = settings.arguments as Map;
          List<QuranModel> audioFiles = a['audioFiles'];
        return  SingleAudioPage(audioFiles: audioFiles);
    });
      case Routes.allAudio:
        return CupertinoPageRoute(builder: (context)=>const AllAudioPage());
      case Routes.saved:
        return CupertinoPageRoute(builder: (context)=>const SavedPage());
      case Routes.home:
        return CupertinoPageRoute(builder: (context)=>const HomePage());
      case Routes.splash:
        return CupertinoPageRoute(builder: (context)=>const SplashPage());
      default:
        return CupertinoPageRoute(
          builder: (context)=>const Scaffold(
            body: Center(child: Text('Route Topilmadi'),),
          ),
        );
    }
  }
}
