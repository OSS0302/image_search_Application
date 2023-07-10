import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/Photo.dart';
import 'package:image_search/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

import '../data/api.dart';

class HomeScreen extends StatefulWidget { // setState울 사용해야되서  Stateless을
  const HomeScreen({Key? key}) : super(key: key); // final 로 선언해서 required  필요하다.

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final api = PixabayApi();

  final _controller =TextEditingController(); //검색 했을떄 가져올 데이털 컨트롨러 (작성한값을 얻으려고한다) 로직 생성




  // 사용후 헤제
  @override
  void dispose() {
    _controller.dispose(); // _controller.dispose 호출
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoprovider = PhotoProvider.of(context); // 선언하면 photoProvider 로직을 사용할 수있다.
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
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller, // TextField 안에 컨트롤러 꽂는다.
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // 검색창 모서리 각도 10 둥글게 한다.
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async { // fecth 로직이 Future이기 떄문에 async 사용한다.
                     final photos = await photoprovider.api.fetch( _controller.text); // 컨트롤러 텍스트를 가져와서 위에 fecth 로직을 수행해라
                     setState(() {
                       _photos = photos; // 새로운 작성된 값이 들어가면서 화면이(_photo) 다시 그려진다.
                     });
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _photos.length , // 아이템 갯수 photo.length()
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //crossAxisCount 열
                    crossAxisSpacing: 16.0, // 검색 앱 가로세로 세팅
                    mainAxisSpacing: 16 //  검색앱 가로세로 세팅
                    ),
                itemBuilder: (context, index) {
                  final photo = _photos[index]; // photo 인덱스 번호 쨰 아이템으로 가져온다.
                  return PhotoWidget(
                    photo: photo, // const 위에 있어서 변수를 사용해야되서  오류가 난다.
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
