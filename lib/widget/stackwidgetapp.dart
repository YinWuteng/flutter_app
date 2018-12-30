import 'package:flutter/material.dart';

//stack布局 类似于frameLayout,positioned 绝对定位

void main() {
  runApp(StackWidgetApp());
}

class StackWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body:
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位活部分定位widget的对齐方式
            children: <Widget>[
              Container(
                child: Text(
                  'Hello world',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
              Positioned(left: 18.0, child: Text('I am Jack')),
              Positioned(top: 18.0, child: Text('Your friend'))
            ],
          ),
        )
        , //通过ConstrainedBox来确保Stack占满屏幕
      ),
    );
  }
}

