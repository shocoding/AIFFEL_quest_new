import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const firstpage(),
    );
  }
}

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pets),
        title: const Text("first page"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // bool 값 출력
              const bool isCat = false;
              print('고양이 인가요? : $isCat');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const secondpage(),
                ),
              );
            },
            child: const Text("next page"),
          ),
          Image.asset('assets/images/cat.jpg',
              width: 300, height: 300, fit: BoxFit.cover)
        ],
      )),
    );
  }
}

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pets),
        title: const Text("second page"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              const bool isCat = true;
              print('고양이 인가요? : $isCat');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyApp(),
                ),
              );
            },
            child: const Text("back"),
          ),
          Image.asset('assets/images/dog.jpg',
              width: 300, height: 300, fit: BoxFit.cover)
        ],
      )),
    );
  }
}
