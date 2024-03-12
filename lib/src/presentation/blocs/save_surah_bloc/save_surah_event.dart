part of 'save_surah_bloc.dart';

abstract class SaveQuranEvent extends Equatable {}


class QuranInsertEvent extends SaveQuranEvent {
  final QuranModelSql quranModelSql;

  QuranInsertEvent({required this.quranModelSql});

  @override
  List<Object?> get props => [quranModelSql];
}


class GetAllQuranEvent extends SaveQuranEvent {

  final List<QuranModelSql> quranModel;

  GetAllQuranEvent({required this.quranModel});

  @override
  List<Object?> get props => [quranModel];
}