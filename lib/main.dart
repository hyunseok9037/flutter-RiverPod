import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 상태 관리 변수
  int number = 1;
  
  // 상태 관리 함수(의미 있는 함수)
  void add(){
    setState(() {
      number = number+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage(number)),
            Expanded(child: BottomPage(add)),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  // 전달 받는 변수(매개변수라 생각합세)
 final int number;
   HeaderPage(this.number,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "$number",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 100,
              decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {

  // Function add;
  final add;

  BottomPage(this.add,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
          ),
          onPressed: (){
            add();
          },
          child: Text("증가", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 100,
          ),),
        ),
      ),
    );
  }
}