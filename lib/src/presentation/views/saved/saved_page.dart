import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surah/src/presentation/blocs/save_surah_bloc/save_surah_bloc.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {


  @override
  void initState() {
    context.read<SaveQuranBloc>().add(GetAllQuranEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: BlocBuilder<SaveQuranBloc, SaveQuranState>(builder: (context, state) {
        if (state is SaveQuranSuccessState) {
          return state.quranModelSql.isNotEmpty
              ? ListView(
                  children: List.generate(state.quranModelSql.length,
                      (index) => Text(state.quranModelSql[index].name)),
                )
              : const Center(child: Text('EMPTY'));
        }
        if (state is SaveQuranErrorState) {
          return Center(
            child: Text(state.errorText),
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }),
    );
  }
}
