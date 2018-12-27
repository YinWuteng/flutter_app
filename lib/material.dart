import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListVioew Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material'),
        ),
        body: Center(
          child: Text('Flutter'),
        ),
      ),
    );
  }
}
