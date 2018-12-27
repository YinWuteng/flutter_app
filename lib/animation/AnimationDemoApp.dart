import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(AnimationDemoApp());
}

class AnimationDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter animation demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation demo'),
        ),
        body: AnimationDemoView(),
      ),
    );
  }
}

class AnimationDemoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemoView>
    with SingleTickerProviderStateMixin {
  static const padding = 16.0;
  AnimationController controller;
  Animation<double> left;
  Animation<Color> color;

  void initState() {
    super.initState();
    //通过Future从而在Dart事件对列里插入以恶搞事件，
    //以达到延后执行的目的
    Future(_initState);

  }

  void _initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //通过MediaQuery获取屏幕宽度
    final mediaQueryDate = MediaQuery.of(context);
    final displayWidth = mediaQueryDate.size.width;
    left =
        Tween(begin: padding, end: displayWidth - padding).animate(controller)
          ..addListener(() {
            //调用setState触发他重新build一个Widget，在build方法里，我们
            //根据Animatable<T>的当前值来创建Widget,达到动画效果
            setState(() {});
          }) //监听动画状态
          ..addStatusListener((status) {
            //让动画往复不断执行
            //以此动画完成
            if (status == AnimationStatus.completed) {
              //我们让动画反正执行一遍
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              //正着重新开始
              controller.forward();
            }
          });
    color=ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final unit = 24.0;
    final marginLeft = left == null ? padding : left.value;
    //把marginLeft单位化
    final unitizedLeft = (marginLeft - padding) / unit;
    final unitizedTop=math.sin(unitizedLeft);
    final marginTop=(unitizedTop+1)*unit+padding;
    final color=this.color==null?Colors.red:this.color.value;
    return Container(
      //根据动画的进度设置圆点的位置
      margin: EdgeInsets.only(left: marginLeft,top: marginTop),
      //画一个小红点
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7.5)
        ),
        width: 15.0,
        height: 15.0,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
