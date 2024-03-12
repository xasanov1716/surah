import 'package:surah/src/config/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:surah/src/config/utils/utils.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {




  _init()async{
    await Future.delayed(const Duration(seconds: 3));
    if(context.mounted) Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.4),
      body: Center(child: Lottie.asset('assets/lottie/book.json',height: 100,width: 100),),
    );
  }
}
