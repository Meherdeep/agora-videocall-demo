import 'package:agora_group_calling/widgets/app_bar.dart';
import 'package:agora_group_calling/widgets/call_function.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  final String userName;
  final String channelName;
  CallPage(this.userName, this.channelName);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(132, 174, 0,0.5),
        title: Text('Hi '+ widget.userName +'!'),
        elevation: 10,
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_pic.png'),
            radius: 10,
            backgroundColor: Color.fromRGBO(255, 104, 220, 1),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.image), 
            onPressed: (){}
          )
        ],
      ),
      body: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          VideoCall(widget.channelName),
          Positioned(
            bottom: 10,
            left: 60,
            child: StatusBar(),
          ),
        ],

      ),
      
    );
  }
}