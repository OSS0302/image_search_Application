import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true, // 제목을 가운데로 오게한다.
        title: const Text(
            '이미지 검색 앱',
          style: TextStyle(color: Colors.black), //제목 이름 검은색으로
        ),
        backgroundColor: Colors.white, // 배경 색을 흰색으로
        elevation: 0, // elevation그림자를 0 으로한다
      ),
      body: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0),) // 검색창 모서리 각도 10 둥글게 한다.
            )
          ),
        )
      ],
      ),
    );
  }
}
