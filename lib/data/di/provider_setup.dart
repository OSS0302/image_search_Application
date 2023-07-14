import 'dart:js';

import 'package:image_search/data/data_source/Pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart'as http;
// 1. provider 전체
List<SingleChildWidget> globalProviders =[
  ...independentModels,
  ...dependentModels,
  ...viewModels,

];
// 2.독립적인 객체
List<SingleChildWidget> independentModels =[
  // provider http 부터 제공한다.
  Provider<http.Client>(
    create: (context) => http.Client(),// 기본 클라이언트 를 제공한다.
  ),
];
//3. 독립적인 객체 에 의존성 있는 객체
//http.Client
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(//받을 타입: http.Client, 만들 타입 PixabayApi
      update:(context , client, _) => PixabayApi(client),//return 타입   //PixabayApi(client)셍상로직
  ),
  //PixabayApi
  ProxyProvider<PixabayApi, PhotoApiRepository>(
      update:(context , api, _) => PhotoApiRepositoryImpl(api),
  ),
  //GetPhotosUseCase
  ProxyProvider<PhotoApiRepository,GetPhotosUseCase>(
      update:(context , repository, _) => GetPhotosUseCase(repository),
  ),
];
  //GetPhotosUseCase
  // 4.ViewModels
  List<SingleChildWidget>viewModels =[
    ChangeNotifierProvider<HomeViewModel>(
    create: (context) =>HomeViewModel(context.read<GetPhotosUseCase>()), // context 통해서 getPhotosUseCase 를 받을 수있다.
    ),
];
