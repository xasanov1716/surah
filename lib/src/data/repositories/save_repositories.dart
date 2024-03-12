import 'package:surah/src/data/datasources/local/local_database.dart';
import 'package:surah/src/data/models/audio_model_sql.dart';

class SaveRepositories {

  Future<void> insertSurah(QuranModelSql quranModelSql)async=>LocalDatabase.insertSurah(quranModelSql);


  Future<List<QuranModelSql>> getAllSurah()async=>  LocalDatabase.getAllSurah();

}