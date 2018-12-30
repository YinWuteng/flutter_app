import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'data.dart';

void main() {
  runApp(UserApp());
}

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Json',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Json'),
        ),
        body: UserWidget(),
      ),
    );
  }
}

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserWidgetState();
  }
}

class _UserWidgetState extends State<UserWidget> {
  String _name;
  var _email;

//  String path = 'http://www.wanandroid.com/tools/mockapi/2008/user';

  _getUserData() {
//    Dio dio = new Dio();
//    Response response;
//    response = await dio.get(path);
    //json字符数组
//    String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
//    //将json字符串转为Dart对象(此处是List)
//    List items = json.decode(jsonStr);
//    _name = items[0]["name"];
    //json字符串
    String result = '{"name":"Yin Wu Teng ","email":"john@example"}';
//
//    Map<String, dynamic> user = json.decode(result);
//    _name = user['name'];
//    _email = user['email'];
//    Map userMap = json.decode(data);
//    var user = User.fromJson(userMap);
//    _name = user.name;
//    _email = user.email;
    // Map<String,dynamic> map=json.decode(data);
     Data data=Data.fromJson(json.decode(result));
     _name=data.name;
     _email=data.email;
  }

  @override
  Widget build(BuildContext context) {
    _getUserData();
    // TODO: implement build
    return Column(
      children: <Widget>[Text(_name), Text(_email)],
    );
  }
}

//class User {
//  final String name;
//  final String email;
//
//  User(this.name, this.email);
//
//  User.fromJson(Map<String, dynamic> json)
//      : name = json['name'],
//        email = json['email'];
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'name': name,
//        'email': email,
//      };
//}
