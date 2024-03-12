import 'package:surah/src/presentation/blocs/info/info_bloc.dart';
import 'package:surah/src/presentation/views/all_audio/all_audio_page.dart';
import 'package:surah/src/presentation/views/saved/saved_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int currentIndex = 0;
  List<Widget> screens =  [ const AllAudioPage(),const SavedPage()];

  @override
  void initState() {
    context.read<InfoBloc>().add(InfoGetAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index){
            currentIndex = index;
            setState(() {});
          },
          items: const[
         BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.save_alt),label: 'Saved'),
      ]),
    );
  }
}