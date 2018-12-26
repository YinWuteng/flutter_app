
import 'package:flutter/material.dart';

//editText button dialog简单使用
void main()=>runApp(new EdBtDialogApp());
class EdBtDialogApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widget'),
        ),
        body: MessageForm(),
      ),
    );
  }

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
