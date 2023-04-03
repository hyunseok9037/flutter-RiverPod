import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int>{
  Counter(super.state);

  void increment(){
    state++;
  }
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(0);
});


void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: HeaderPage()),
            Expanded(child: BottomPage()),
          ],
        ),
      ),
    );
  }
}

class HeaderPage extends ConsumerWidget {
  HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int num = ref.watch(counterProvider);
    return Container(
      color: Colors.red,
      child: Align(
        child: Text(
          "$num",
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

class BottomPage extends ConsumerWidget {
  BottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterProvider.notifier);
    return Container(
      color: Colors.blue,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
          ),
          onPressed: (){
            counter.increment();
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