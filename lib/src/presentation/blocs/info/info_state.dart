part of 'info_bloc.dart';

@immutable

class InfoState {
  final FormStatus status;
  final String errorText;
  final List<QuranModel> quranModel;

  const InfoState(
      {required this.quranModel,
      required this.status,
      required this.errorText});

  InfoState copyWith({
    String? errorText,
    List<QuranModel>? quranModel,
    FormStatus? status,
  }) =>
      InfoState(
          quranModel: quranModel ?? this.quranModel,
          status: status ?? this.status,
          errorText: errorText ?? this.errorText);
}
