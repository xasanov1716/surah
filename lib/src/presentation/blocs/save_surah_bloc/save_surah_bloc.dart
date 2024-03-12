
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:surah/src/data/models/audio_model_sql.dart';
import 'package:surah/src/data/repositories/save_repositories.dart';

part 'save_surah_event.dart';
part 'save_surah_state.dart';

class SaveQuranBloc extends Bloc<SaveQuranEvent, SaveQuranState> {
    final SaveRepositories saveRepositories;
  SaveQuranBloc(this.saveRepositories) : super(SaveQuranInitial()) {
    
    
    
    on<QuranInsertEvent>((event, emit)async {
      emit(SaveQuranLoadingState());
        try{
          await saveRepositories.insertSurah(event.quranModelSql);
          emit(SaveQuranSuccessState(quranModelSql: const[]));
        }
            catch(e){
          emit(SaveQuranErrorState(errorText: e.toString()));
            }
    });
    
    on<GetAllQuranEvent>((event, emit)async{
      List<QuranModelSql> quran;
      emit(SaveQuranLoadingState());
      try{
       quran =   await saveRepositories.getAllSurah();
       emit(SaveQuranSuccessState(quranModelSql: quran));
      }
          catch(e){
        emit(SaveQuranErrorState(errorText: e.toString()));
          }
    });
  }
}
