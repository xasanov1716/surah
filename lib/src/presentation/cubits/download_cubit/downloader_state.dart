import 'package:equatable/equatable.dart';



class DownLoaderState extends Equatable {
  const DownLoaderState({
    required this.progress,
    required this.newFileLocation,
  });

  final double progress;
  final String newFileLocation;

  DownLoaderState copyWith({
    double? progress,
    String? newFileLocation,
  }) =>
      DownLoaderState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
      );

  @override
  List<Object?> get props => [
    progress,
    newFileLocation,
  ];
}