import 'package:flutter/material.dart';

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
                // Navigate to the registration page
                // Use Navigator.push() here
              },
              child: Text("Register Now"),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the forgot password page
                // Use Navigator.push() here
              },
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

    // Add your authentication logic here
    // You can use Firebase, a REST API, or any other authentication method

    // If authentication is successful, navigate to the home page
    // Use Navigator.pushReplacement() here
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
