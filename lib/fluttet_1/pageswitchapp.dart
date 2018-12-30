
import 'package:flutter/material.dart';

void main() => runApp(new PageSwitchApp());

//页面切换及显示返回参数
class PageSwitchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'ListVioew Demo',
      home: FirstScreen(),
    );
  }
}

//第一个页面
class FirstScreen extends StatefulWidget {
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation demo'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('First screen'),
            onPressed: () async {
              var msg = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => SecondScreen()),);
              debugPrint('msg=$msg');
            }),
      ),
    );
  }
}

//第二个页面
class SecondScreen extends StatefulWidget {
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation demo'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Second screen'),
            onPressed: () {
              Navigator.pop(context, 'message from second screen');
            }),
      ),
    );
  }
}
