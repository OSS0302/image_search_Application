import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(16.0),
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
                itemCount: 10, // 아이템 갯수
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //crossAxisCount 열
                      crossAxisSpacing: 16.0, // 검색 앱 가로세로 세팅
                      mainAxisSpacing: 16 //  검색앱 가로세로 세팅
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                     decoration: const BoxDecoration(
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage('data:image/jpeg;base64,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')
                       )
                     ),
                    ); //위젯을 리턴하면된다.
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
