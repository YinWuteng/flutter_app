import 'package:flutter/material.dart';

void main() {
  runApp(SwitchBtnApp());
}

//选择按钮
class SwitchBtnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "Switchbtn",
        home: Center(
          child: SwitchAndCheckBoxTestRoute(),
        ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SwitchAndCheckBoxTestRouteState();
  }
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkBoxSeleccted = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Switch(
            value: _switchSelected //当前状态
            ,
            onChanged: (value) {
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkBoxSeleccted,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkBoxSeleccted = value;
              });
            })
      ],
    );
  }
}
