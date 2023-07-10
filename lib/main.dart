import 'package:flutter/material.dart';
import 'package:image_search/ui/home_screen.dart';

import 'data/api.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(api:PixabayApi()), // 오류가 나는 이유는 더이상 const가 아니기때문이다.
    );
  }
}

