import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/widgets/my_button.dart';
import 'package:rainlette/utils/asset_container.dart';
import 'package:rainlette/utils/notification_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  String _newUsername = "";
  String _currentUsername = "";
  final TextEditingController _usernameTextController = TextEditingController();
  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
    _getCurrentUsername();
  }

  void _getCurrentUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentUsername = (await prefs.getString('username'))!;
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: const InputDecoration(hintText: "Username"),
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'enter username' : null,
      onSaved: (val) => _newUsername = val!,
    );
    return Scaffold(
      backgroundColor: semiBlue,
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              "Return to home ->",
              style: TextStyle(fontSize: 17, color: lightGray),
            )
          ],
        ),
        backgroundColor: darkBlue,
        actions: [
          IconButton(
              onPressed: () {
                redirectToHome();
              },
              icon: Icon(Icons.account_circle_rounded)),
          assetContainer("assets/run.gif")
        ],
      ),
      body: Container(
        width: 50,
        height: 20,
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: mainGif.image,
            scale: 6,
            //fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Current username is: " + _currentUsername),
            SizedBox(height: 22),
            Text("Enter new username"),
            SizedBox(height: 22),
            Container(child: username,width: 500,),
            SizedBox(height: 22),
            MyButton(label: "Change username", onPressed: _changeUsername)
          ],
        ),
      ),
    );
  }

  void _changeUsername() async {
    _newUsername = _usernameTextController.text;
    NotificationApi.showNotification(
        title: 'User', body: 'Username changed', payload: 'notification');
    setState(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _currentUsername = (await prefs.getString('username'))!;
      await prefs.setString('username', _newUsername);
      _usernameChangedDialog();
    });
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(weatherData: mainWeatherData)));
  }

  Future<void> _usernameChangedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          title: const Text('Changed!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Username has been successfully changed',
                  style: TextStyle(color: lightBlue),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: lightBlue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
