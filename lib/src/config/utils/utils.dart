
class Utils {
  static bool isShuffle = false;
  static bool isPlaying = false;
  static int index = 0;
  static int surahIndex = 0;
}


double height = 0.0;
double width = 0.0;


double byteToMb(int byte){
  return (byte / (1024 * 1024)).ceilToDouble();
}