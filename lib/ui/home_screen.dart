import 'package:flutter/material.dart';
import 'package:image_search/widget/photo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                    return const PhotoWidget(); //Photowidget 으로 변경 해주고 호출
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
