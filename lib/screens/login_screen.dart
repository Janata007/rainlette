import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _username, _password;
  bool _passwordVisible = false;
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _restoreUsernameAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: const InputDecoration(hintText: "Username"),
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'enter username' : null,
      onSaved: (val) => _username = val!,
      autofocus: true,
    );
    final password = TextFormField(
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

    return Scaffold(
      backgroundColor: semiBlue,
      appBar: AppBar(
        backgroundColor: darkBlue,
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
          const SizedBox(
            height: 48.0,
          ),
          username,
          const SizedBox(height: 8.0),
          password,
          const SizedBox(height: 24.0),
          TextButton(onPressed: () {}, child: Text("Log in")),
        ],
      ))),
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

  void submit() {
    storage.write("username", _username);
    storage.write("password", _password);
  }
}
