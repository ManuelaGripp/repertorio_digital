import 'package:flutter/material.dart';
import 'package:repertorio/app/view/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(250, 180, 17, 0.9)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: AppWidget(),
      ),
    );
  }
}
