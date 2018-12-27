import 'package:flutter/material.dart';

void main() => runApp(new EchoClientApp());

//输入客户端，使用edietext，利用Container做了一个按钮，通过InkWell监听
//手势，消息发送页面
class EchoClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter UX demo',
      home: MessageListScreen(),
    );
  }
}

class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MessageForm(),
    );
  }
}

//信息输入框布局
class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  final editController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁editController释放志愿
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          //使用Expanded让输入框占满一行里除按钮外的所有空间
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(8.0),
                ),
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black54,
                ),
                controller: editController,
                //自动获取焦点，在页面打开是就会自动弹出输入法
                autofocus: true,
              ),
            ),
          ),
          //事件
          InkWell(
            onTap: () {
              debugPrint('send: ${editController.text}');
              //数据填充
              final msg = Message(
                  editController.text, DateTime
                  .now()
                  .millisecondsSinceEpoch);
              //关闭页面，并发送数据到上一个页面
              Navigator.pop(context, msg);
            },
            onDoubleTap: () => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text('send'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//消息展示界面
class MessageListScreen extends StatelessWidget {
  //引入GlobalKey,应用全局唯一的key，把key设置给MessageList后，
  //我们就能够通过这个key拿到对应的statefulWidget 的state
  final messageListKey = GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Echo client'),
      ),
      body: MessageList(key: messageListKey,),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //push 一个新的route到Navigator管理的栈中，以此来打开一个页面,接收上一个页面返回数据
          // 接收上一个页面数据需要使用异步，使用async 和 await
          final result = await Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddMessageScreen()));

          debugPrint('result=$result');
          if(result is Message){
            messageListKey.currentState.addMessage(result);
          }
        },
        tooltip: 'Add message',
        child: Icon(Icons.add),
      ),
    );
  }
}

//数据建模，消息结构体

class Message {
  final String msg;
  final int timestamp;

  Message(this.msg, this.timestamp);

  String toString() {
    return 'Message{msg:$msg,timestamp:$timestamp}';
  }
}

//使用listView展示数据
class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
  final List<Message> message = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: message.length,
      itemBuilder: (context, index) {
        final msg = message[index];
        final subtitle = DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
            .toLocal()
            .toIso8601String();
        return ListTile(
          title: Text(msg.msg),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  void addMessage(Message msg) {
    setState(() {
      message.add(msg);
    });
  }
}
