import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/loading.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/widgets/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:get_storage/get_storage.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _username = "";
  String _password = "";
  String _password2 = "";
  bool _passwordVisible = false;
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordTextController2 = TextEditingController();

  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: const InputDecoration(hintText: "Username"),
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'enter username' : null,
      onSaved: (val) => _username = val!,
    );
    final password1 = TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: darkBlue,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
      ),
      controller: _passwordTextController,
      validator: (val) => val!.isEmpty ? 'enter password' : null,
      onSaved: (val) => _password = val!,
    );
    final password2 = TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Re-enter password",
        suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: darkBlue,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
      ),
      controller: _passwordTextController2,
      validator: (val) => val!.isEmpty ? 'enter password' : null,
      onSaved: (val) => _password = val!,
    );

    return Scaffold(
      backgroundColor: semiBlue,
      appBar: AppBar(
        title: Column(children: <Widget>[
          Text("Return to login ->", style: TextStyle(fontSize: 17, color: lightGray),)
        ],),
        backgroundColor: darkBlue,
        actions: [
          IconButton(onPressed: (){
            redirectToLogin();
          }, icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      body: Center(
          child: Form(
              child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[logo]),
          Row(mainAxisAlignment: MainAxisAlignment.center ,
          children: [Text("REGISTER",
            style: TextStyle(fontSize: 20, color: darkBlue, fontWeight: FontWeight.bold),)],),
          const SizedBox(
            height: 48.0,
          ),
          username,
          const SizedBox(height: 8.0),
          password1,
          const SizedBox(height: 8.0),
          password2,
          const SizedBox(height: 24.0),
          MyButton(label: "Register", onPressed: register),
        ],
      ))),
    );
  }


  void register() {
    _username = _usernameTextController.text;
    _password = _passwordTextController.text;
    _password2 = _passwordTextController2.text;

    if(_password.compareTo(_password2)!=0|| _username=="" || _password=="" || _password2=="") {
      _registerErrorDialog();
    }
    else {
      _rememberUsernameAndPassword();
      redirectToLogin();
    }
  }

  void redirectToLogin() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<void> _registerErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          title: const Text('Error while registering'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Passwords do not match or there is an empy field. Please try again',
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

  void _rememberUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    await prefs.setString('password', _password);
  }
}
