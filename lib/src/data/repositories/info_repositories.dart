import 'package:surah/src/data/datasources/remote/service.dart';
import 'package:surah/src/data/models/response.dart';

class InfoRepositories {

  final ApiService apiService;

  InfoRepositories({required this.apiService});

  Future<UniversalResponse> getAllInfo()=>apiService.getAllSurah();

}