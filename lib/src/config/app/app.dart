import 'package:surah/src/config/routes/router.dart';
import 'package:surah/src/data/datasources/remote/service.dart';
import 'package:surah/src/data/repositories/audio_repositories.dart';
import 'package:surah/src/data/repositories/info_repositories.dart';
import 'package:surah/src/presentation/blocs/audio_bloc/audio_bloc.dart';
import 'package:surah/src/presentation/blocs/info/info_bloc.dart';
import 'package:surah/src/presentation/cubits/connectivity/connectivity_cubit.dart';
import 'package:surah/src/presentation/cubits/download_cubit/download_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=> DownLoaderCubit()),
      BlocProvider(create: (_)=>ConnectivityCubit()),
      BlocProvider(create: (_)=> InfoBloc(InfoRepositories(apiService: ApiService()))),
      BlocProvider(create: (_)=>AudioBloc(AudioPlayerService()))
    ], child: MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
    ));
  }
}
