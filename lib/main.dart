import 'package:flutter/material.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:number_trivia_app/injection_container.dart' as di;

void main() async {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    di.init();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // di.init();
    return MaterialApp(
      title: 'Number Trivia',
      home: NumberTriviaPage(),
    );
  }
}
