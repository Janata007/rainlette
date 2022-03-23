import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/widgets/my_button.dart';
import 'package:rainlette/utils/asset_container.dart';
import 'package:rainlette/utils/notification_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'login_screen.dart';

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
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            username,
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
    });
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(weatherData: mainWeatherData)));
  }
}
