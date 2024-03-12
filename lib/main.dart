import 'package:surah/src/config/app/app.dart';
import 'package:flutter/material.dart';

import 'src/data/datasources/local/local_database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalDatabase.getInstance;
  runApp(const App());
}