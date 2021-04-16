import 'package:flutter/material.dart';
import 'package:serelizacao_arquivos_json_poc/app/screens/home_view_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data from Json File',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomeViewScreen(),
    );
  }
}

