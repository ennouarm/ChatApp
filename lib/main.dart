
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newproj3/Theme/light_mode.dart';
import 'package:newproj3/firebase_options.dart';

import 'Services/auth/AuthGate.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: const AuthGate(),
    );
  }
}

