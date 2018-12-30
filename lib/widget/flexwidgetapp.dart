import 'package:flutter/material.dart';

//弹性布局 flex expanded,流式布局wrap,flow

void main() {
  runApp(FlexWidgetApp());
}

class FlexWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flex',
      home: Scaffold(
          appBar: AppBar(
            title: Text('FlexAndExpanded'),
          ),
          body: Flow(
            delegate: TestFlowDelegate(EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.red,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.green,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.blue,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.yellow,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.brown,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                color: Colors.purple,
              )
            ],
          )

//        Wrap(
//          spacing: 8.0, //主轴（水平）方向间距
//          runSpacing: 4.0,//纵轴（垂直）方向间距
//          alignment: WrapAlignment.center, //沿主轴方向据居中
//          children: <Widget>[
//            Chip(label: Text('Hanilton'),
//              avatar:CircleAvatar(backgroundColor:Colors.blue ,child: Text('A'))),
//            Chip(label: Text('Lafayette'),
//            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('M'))),
//            Chip(label: Text('Mulligan'),
//            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('H'))),
//            Chip(label: Text('Laurens'),
//            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text('J'),),)
//          ],
//        ),
          ),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        //flex的两个widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 30,
                  color: Colors.red,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: 30,
                  color: Colors.green,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            //flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate(this.margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    //计算每个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
