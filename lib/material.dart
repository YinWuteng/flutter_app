import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final buildings=[
//      Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
//      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
//      Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
//      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
//      Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
//      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
//      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
//      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
//      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
//
//      // double 一下
//      Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
//      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
//      Building(BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
//      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
//      Building(BuildingType.theater, 'United Artists Stonestown Twin', '501 Buckingham Way'),
//      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
//      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
//      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
//      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
//    ];
    return MaterialApp(
      title: 'ListVioew Demo',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Building'),
          ),
          body: RaisedButton(
              child: Text('click'), onPressed: () => debugPrint('cicked'))),
    );

//    final titleSection = TitleSelection(
//        'Oeschinen laje Campground', 'Kandersteg,Switzerland', 41);
//    final textSection = Container(
//      padding: const EdgeInsets.all(32.0),
//      child: Text(
//        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
//            'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
//            'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
//            'and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. '
//            'Activities enjoyed here include rowing, and riding the summer toboggan run',
//        softWrap: true,
//      ),
//    );
//    Widget buttonSection=Container(
//      child: Row(
//        //沿水平方向放置
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          _buildButtonColumn(context, Icons.call, 'Call'),
//          _buildButtonColumn(context, Icons.near_me, 'ROUTE'),
//          _buildButtonColumn(context, Icons.share, 'SHARE')
//        ],
//      ),
//    );
//    // TODO: implement build
//    return new MaterialApp(
//      title: 'Flutter UI basic 1',
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Top Lakes'),
//          ),
//          body: ListView(
//            children: <Widget>[
//              Image.asset(
//                'images/bg.png',
//                height: 240,
//                fit: BoxFit.cover,
//              ),
//              titleSection,
//              buttonSection,
//              textSection
//            ],
//          )),
//    );
//  }
  }
}

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

class MessageForm extends StatefulWidget {
  MessageFormState createState() => new MessageFormState();
}

class MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
            child: TextField(
          controller: editController,
        )),
        RaisedButton(
          child: Text('click'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text(editController.text),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK')),
                    ],
                  );
                });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //释放资源
    editController.dispose();
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton pressed'),
      child: Text('BUTTON'),
    );
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton pressed'),
      child: Text('BUTTON'),
    );

//    return Container(
//      child: Center(
//          child: Text('text'),),
//      padding: EdgeInsets.all(8.0),
//      height: 50,
//      margin: EdgeInsets.all(4.0),
//      width: 80.0,
//      decoration: BoxDecoration(
//        //背景色
//        color:Colors.grey,
//        //圆角
//        borderRadius: BorderRadius.circular(5.0)
//      ),
//    );
//    return Row(
//      children: <Widget>[
//        Expanded(flex: 1, child: Center(child: Text('text1'))),
//        Expanded(flex: 1, child: Center(child: Text('text1'))),
//        Expanded(flex: 1, child: Center(child: Text('text1'))),
//        Expanded(flex: 1, child: Center(child: Text('text1')))
//      ],
//    );
    return Stack(
      alignment: const Alignment(-0.5, -0.5),
      children: <Widget>[
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        Text('foobar')
      ],
    );
  }
}

class RollingButton extends StatefulWidget {
  RollingState createState() => new RollingState();
}

class RollingState extends State<RollingButton> {
  final _random = Random();

  List<int> _roll() {
    final roll1 = _random.nextInt(6) + 1;
    final roll2 = _random.nextInt(6) + 1;
    return [roll1, roll2];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    debugPrint('_RollingState._onPressed');
    final rollResults = _roll();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Roll result:(${rollResults[0]},${rollResults[1]})'),
          );
        });
  }
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[]; //设置内容
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0); //设置字体
  final Set<WordPair> _saved = new Set<WordPair>();

  RandomWordsState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Startup name Generator"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        //添加心形图标
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divide =
              ListTile.divideTiles(context: context, tiles: tiles).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text("Saved Suggestions"),
            ),
            body: new ListView(
              children: divide,
            ),
          );
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => new RandomWordsState();
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle one');
    } else {
      return MaterialButton(onPressed: () {}, child: Text('Toggle two'));
    }
  }

//  String textToShow = "I Like Flutter";
//
//  void _updateText() {
//    setState(() {
//      textToShow = "Flutter is Awesome";
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: "Update Text",
        child: Icon(Icons.update),
      ),
    );
  }
}
