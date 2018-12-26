import 'package:flutter/material.dart';


//简单布局显示代码
void main() => runApp(new NewsApp());
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final titleSection = TitleSelection(
        'Oeschinen laje Campground', 'Kandersteg,Switzerland', 41);
    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
            'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
            'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
            'and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. '
            'Activities enjoyed here include rowing, and riding the summer toboggan run',
        softWrap: true,
      ),
    );
    Widget buttonSection=Container(
      child: Row(
        //沿水平方向放置
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'Call'),
          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(context, Icons.share, 'SHARE')
        ],
      ),
    );
    return new MaterialApp(
      title: 'Flutter UI basic 1',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Top Lakes'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/bg.png',
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          )),
    );
  }
}

//文章上半部显示
class TitleSelection extends StatelessWidget {
  final String title;
  final String subTitle;
  final int starCount;

  TitleSelection(this.title, this.subTitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //上下左右设置padding都是32
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                //竖直方向
                crossAxisAlignment: CrossAxisAlignment.start, //文本左边对其
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(starCount.toString())
        ],
      ),
    );
  }
}


Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;
  return Column(
    //尽量少占用free space，类似于 Android中的wrap_content
    mainAxisSize: MainAxisSize.min,
    //沿着main axis居中放置
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}

