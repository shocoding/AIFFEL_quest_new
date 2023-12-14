import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '플러터 테스트',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const homePage(),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('플러터 테스터'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          )),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {debugPrint('Text');},
              child :const Text("Text")
              ),
              Stack(
                children: [
                  Container(
                    width:300,
                    height:300,
                    color: Colors.red,
                  ),
                  Container(
                    width:240,
                    height:240,
                    color: Colors.blue,
                  ),
                  Container(
                    width:180,
                    height:180,
                    color: Colors.green,
                  ),
                  Container(
                    width:120,
                    height:120,
                    color: Colors.yellow,
                  ),
                  Container(
                    width:60,
                    height:60,
                    color: Colors.red,
                  )
                ]
              )
            ],
          )
        )
      ),
    );
  }
}

/* 회고. Material app을 안하고 바로 scaffold로 넘어가니 오류가 생기는 걸 볼 수 있었다.
오류를 해결하고 잘 작성하였다.
*/
