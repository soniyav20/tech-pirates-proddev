import 'package:flutter/material.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/services/services.dart';
import 'package:prod_dev_23/views/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _loginPressed();
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text("Register Now"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password"),
            ),
          ],
        ),
      ),
    );
  }

  void _loginPressed() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      showSnackbar(context, "Email cannot be empty");
      return;
    }

    if (password.length < 6) {
      showSnackbar(context, "Password must be at least 6 characters long");
      return;
    }
    Services obj = ServiceImp();
    try {
      obj.signin(mail: emailController.text, pass: passwordController.text);
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
