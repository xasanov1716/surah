import 'package:flutter/cupertino.dart';
import 'package:surah/src/data/models/quran_model.dart';
import 'package:surah/src/data/models/response.dart';
import 'package:surah/src/data/repositories/info_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/form_status.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepositories infoRepositories;
  InfoBloc(this.infoRepositories) : super(InfoState(quranModel: [QuranModel()], status: FormStatus.pure, errorText: '')) {
    on<InfoGetAllEvent>((event, emit)async {
    emit(state.copyWith(status: FormStatus.loading));
      final UniversalResponse data = await infoRepositories.getAllInfo();
      if(data.error.isEmpty){
        emit(state.copyWith(quranModel: data.data, status:  FormStatus.success));
      }else{
        emit(state.copyWith(status: FormStatus.error,errorText: data.error));
      }
    });
  }
}
