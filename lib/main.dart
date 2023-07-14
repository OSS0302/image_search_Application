import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/Pixabay_api.dart';
import 'package:image_search/data/di/provider_setup.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'data/repository/photo_api_repository_impl.dart';

void main() {
  runApp(
    MultiProvider(providers: globalProviders,
        child: const MyApp(),
  ),
  );
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
      home: const HomeScreen(),
    );
  }
}
