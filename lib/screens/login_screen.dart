import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _username, _password;

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _restoreUsernameAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: semiBlue,
      appBar: AppBar(
        backgroundColor: darkBlue,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                child: logo),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextField(
                controller: _usernameTextController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
        Expanded(child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextField(
                controller: _passwordTextController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),),
          ],
        ),
      ),
    );
  }

  void _restoreUsernameAndPassword() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
     // _username = prefs.getString('username') ?? '';
     // _password = prefs.getString('password') ?? '';
      _usernameTextController.text = _username;
      _passwordTextController.text = _password;
    });
  }
}
