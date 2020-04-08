import './call_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userNameController = TextEditingController();
  final channelNameController = TextEditingController();
  bool validateError = false;

  // Passes value to the next page and gets camera and microphone permission
  // void submitInput() async{
  //   if (userNameController.text.isEmpty || channelNameController.text.isEmpty){
  //     return;
  //   }
  //   await _handleCameraAndMic();
    
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => CallPage(userNameController.text, channelNameController.text)
  //     )
  //   );
  // }

  @override
  void dispose(){   
    channelNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Agora group calling', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            // Username
            Container(
              width: 300,
              child: TextField(
                controller: userNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'User name',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'John Doe',
                  hintStyle: TextStyle(color: Color.fromRGBO(220, 231, 220,1)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ), 
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            // Channel Name
            Container(
              width: 300,
              child: TextField(
                controller: channelNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Channel name',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'test',
                  hintStyle: TextStyle(color: Color.fromRGBO(220, 231, 220,1)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(136, 177, 0, 1),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Container(
              width: 100,
              child: MaterialButton(
                onPressed: onJoin,
                color: Color.fromRGBO(136, 177, 0, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Join', 
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    Icon(Icons.arrow_right,
                      color: Colors.white,
                    ),

                  ],
                ),
                ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          ],
        ),
      ),),
    );
  }
  Future<void> onJoin() async {
    // update input validation
    setState(() {
      (channelNameController.text.isEmpty || userNameController.text.isEmpty) 
      ? validateError = true 
      : validateError = false;
    });
    if (channelNameController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(userNameController.text, channelNameController.text),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}