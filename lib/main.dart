import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/database/note_helper.dart';
import 'package:notes_app/models/note_adapter.dart';
import 'package:notes_app/screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox(NoteHelper.noteBox);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito'
      ),
      home: SplashScreen()
    );
  }
}

