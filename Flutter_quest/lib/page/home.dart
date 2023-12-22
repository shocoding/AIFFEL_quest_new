
import 'package:flutter/material.dart';
import 'package:pomodoroapp/page/bluetooth.dart';



class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("뽀몽"),
          actions: [
            IconButton(
              icon: const Icon(Icons.bluetooth), // 첫 번째 아이콘
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //홈에서 블루투스 누르면 flutterblueapp으로 이동
                    builder: (context) => const FlutterBlueApp(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings), // 첫 번째 아이콘
              onPressed: () {
                // 첫 번째 아이콘을 눌렀을 때 수행할 작업
              },
            ),
          ],
        ),
        body: ListView());
  }
}
