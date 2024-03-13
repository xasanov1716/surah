import 'package:surah/src/config/routes/router.dart';
import 'package:surah/src/config/constant/app_constants.dart';
import 'package:surah/src/config/utils/utils.dart';
import 'package:surah/src/data/models/form_status.dart';
import 'package:surah/src/presentation/blocs/audio_bloc/audio_bloc.dart';
import 'package:surah/src/presentation/blocs/info/info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAudioPage extends StatelessWidget {
   const AllAudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: const Text('Quran All Surah'),
        ),
        body: BlocBuilder<InfoBloc,InfoState>(builder: (context, state){
          if(FormStatus.error == state.status){
            return Center(child: Text(state.errorText,style: const TextStyle(color: Colors.white),));
          }
          if(FormStatus.success == state.status){
            return  Column(
              children: [
                Expanded(
                  child: ListView(
                    children: List.generate(state.quranModel.length,
                            (index) => Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: ListTile(
                            onTap: (){
                              var args =  {
                                'audioFiles': state.quranModel
                              };
                              Utils.index = index;
                              Utils.surahIndex = index;
                              context.read<AudioBloc>().add(PlayAudioEvent(audioUrl: state.quranModel[Utils.surahIndex].audio!));
                              Navigator.pushNamed(context, Routes.singleAudio,arguments: args);
                            },
                            leading: Image.network(
                                baseImage),
                            title:  Text(state.quranModel[index].nameLat!,style: const TextStyle(color: Colors.white),),
                            subtitle:  Text(state.quranModel[index].author!,style: const TextStyle(color: Colors.white)),
                            trailing:  Text(state.quranModel[index].name!,style: const TextStyle(color: Colors.white)),
                          ),
                        )),
                  ),
                )
              ],
            );
          }
          return const Center(child: CupertinoActivityIndicator());
        }));
  }

}
