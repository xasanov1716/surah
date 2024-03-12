part of 'save_surah_bloc.dart';

abstract class SaveQuranState extends Equatable {}

class SaveQuranInitial extends SaveQuranState {
  @override
  List<Object?> get props => [];
}

class SaveQuranLoadingState extends SaveQuranState {
  @override
  List<Object?> get props => [];
}

class SaveQuranSuccessState extends SaveQuranState {


  final List<QuranModelSql> quranModelSql;

  SaveQuranSuccessState({required this.quranModelSql});


  @override
  List<Object?> get props => [quranModelSql];
}

class SaveQuranErrorState extends SaveQuranState {
  final String errorText;

  SaveQuranErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}