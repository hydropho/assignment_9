import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http_flutter/firebase_options.dart';
import 'package:http_flutter/screens/home/home_page.dart';

void main() {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
