import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainlette/screens/main_screen.dart';
import 'package:rainlette/screens/widgets/my_button.dart';
import 'package:rainlette/utils/asset_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _oldPassword = "";
  String pass = "";
  String _password = "";
  String _password2 = "";
  bool _passwordVisible = false;
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordTextController2 =
      TextEditingController();
  final TextEditingController _oldPasswordTextController =
      TextEditingController();
  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _getCurrentPassword();
  }

  @override
  Widget build(BuildContext context) {
    final oldPassword = TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Old Password",
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
      controller: _oldPasswordTextController,
      validator: (val) => val!.isEmpty ? 'enter current password' : null,
      onSaved: (val) => _oldPassword = val!,
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
      validator: (val) => val!.isEmpty ? 'enter new password' : null,
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
      validator: (val) => val!.isEmpty ? 'enter new password' : null,
      onSaved: (val) => _password = val!,
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
        body: Center(
            child: Form(
                child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[logo]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change Password",
                  style: TextStyle(
                      fontSize: 20,
                      color: darkBlue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Text("Enter current password"),
            const SizedBox(height: 24.0),
            oldPassword,
            const SizedBox(height: 24.0),
            Text("Enter new password"),
            password1,
            const SizedBox(height: 8.0),
            password2,
            const SizedBox(height: 24.0),
            MyButton(label: "Change Password", onPressed: _changePassword),
          ],
        ))));
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(weatherData: mainWeatherData)));
  }

  void _changePassword() {
    _password = _passwordTextController.text;
    _password2 = _passwordTextController2.text;
    _oldPassword = _oldPasswordTextController.text;

    if (_password.compareTo(_password2) != 0 ||
        _password == "" ||
        _password2 == "" ||
        _oldPassword.compareTo(pass) != 0) {
      _errorDialog();
    } else {
      _changeNewPassword();
    }
  }

  void _changeNewPassword() async {
    setState(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('password', _password);
      _passwordChangedDialog();
    });
  }

  void _getCurrentPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pass = (await prefs.getString('password'))!;
  }

  Future<void> _errorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          title: const Text('Error while changing password'),
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
  Future<void> _passwordChangedDialog() async {
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
                  'Password has been successfully changed',
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
