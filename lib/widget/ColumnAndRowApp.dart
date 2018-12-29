import 'package:flutter/material.dart';

void main() {
  runApp(ColumnAndRowApp());
}

//column 、row、container基本使用
class ColumnAndRowApp extends StatelessWidget {
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Switchbtn",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, //有效，外层colum高度为整个屏幕
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                    children: <Widget>[Text('hello world'), Text('I am jask')],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
//        Scaffold(
//          appBar:AppBar(
//            title: Text('线性布局Row、Column'),
//          ) ,
//          body: Column(
//            //测试Row对其方式，排除Column默认居中对齐的干扰
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Row(
//                //水平方向占用空间。默认占满
//                //居中对齐
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text('hello world'),
//                  Text('I am jack')
//                ],
//              ),
//              Row(
//                //宽度等于所有子widgets占用的水平空间
//                mainAxisSize: MainAxisSize.min,
//                //中间对齐
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Text('hello world'),
//                  Text('I an jack')
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                textDirection: TextDirection.rtl,
//                children: <Widget>[
//                  Text('hello world'),
//                  Text('I am jack')
//                ],
//              ),
//              Row(
//                //纵轴对齐，左对齐
//                crossAxisAlignment: CrossAxisAlignment.start,
//                verticalDirection: VerticalDirection.up,
//                children: <Widget>[
//                  Text('hello world', style: TextStyle(fontSize: 30.0),),
//                  Text('I am jack')
//                ],
//              )
//            ],
//          ),
//        )
    );
  }
}
