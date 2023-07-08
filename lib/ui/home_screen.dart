import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/model/Photo.dart';
import 'package:image_search/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // http 통신 비동기
  Future<List<Photo>> fetcth(String query) async {
    // 스트링 커리 지정 async  비동기
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=38081108-118a6127b8642576a388e6c5e&q=$query&image_type=photo&pretty=true'));
    //Response body를 제이슨 디코드변환 사용해야한다.
    Map<String,  dynamic> jsonResponse = jsonDecode(response.body); //맵형태로 얻는 데이터는 제이슨 형태로 데이터를 얻을수있다
     // 히즈 문제
    Iterable hits = jsonResponse['hits']; // 현 데이터는 맵형태
    hits.map((e) => Photo.fromJson(e)).toList(); //map data -> 리스트로 변환

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 제목을 가운데로 오게한다.
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black), //제목 이름 검은색으로
        ),
        backgroundColor: Colors.white, // 배경 색을 흰색으로
        elevation: 0, // elevation그림자를 0 으로한다
      ),
      body: Padding(
        //const  컴파일 타임에 만들어지고 계속계속해서 재사용 되서 메모리를 줄여주는 효과 가 있다.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // 검색창 모서리 각도 10 둥글게 한다.
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 10, // 아이템 갯수
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //crossAxisCount 열
                    crossAxisSpacing: 16.0, // 검색 앱 가로세로 세팅
                    mainAxisSpacing: 16 //  검색앱 가로세로 세팅
                    ),
                itemBuilder: (context, index) {
                  return const PhotoWidget(
                    photo: Photo(),
                  ); //Photowidget 으로 변경 해주고 호출
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
