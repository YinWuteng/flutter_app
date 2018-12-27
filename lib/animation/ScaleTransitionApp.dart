import 'package:flutter/material.dart';

//ScaleTransition、CurvedAnimation  动画使用代码
void main() {
  runApp(ScaleTransitionApp());
}

class ScaleTransitionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('animation'),
        ),
        body: AnimWidget(),
      ),
    );
  }
}

//动画初始化，动画是有状态的，所以使用StatefulWidget

class AnimWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimWidgetState();
  }
}

class _AnimWidgetState extends State<AnimWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  void initState() {
    super.initState();
    //AnimationController的输出为线性，非线性可以使用CurveAnimation
    controller = AnimationController(
        //动画时长
        duration: Duration(milliseconds: 5000),
        //提供vsync最简单的方式就是直接继承SingleTickerProviderStateMixin
        vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    //调用controller方法开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var scaled = ScaleTransition(
        child: FlutterLogo(
          size: 200.0,
        ),
        scale: curve);
    return FadeTransition(child: scaled, opacity: curve);
  }
}
