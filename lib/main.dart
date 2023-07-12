import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repository/photo_api_repository_impl.dart';

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
      home: ChangeNotifierProvider ( // 감지할 수있는 프로바이더로
          create: (_)=> HomeViewModel(PhotoApiRepositoryImpl()),
          child: const HomeScreen()
      ),
    );
  }
}
