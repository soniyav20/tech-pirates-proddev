import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:prod_dev_23/services/service_imp.dart';
import 'package:prod_dev_23/views/forgot_password_page.dart';
import 'package:prod_dev_23/views/home_page.dart';
import 'package:prod_dev_23/views/signup_page.dart';

import '../services/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _loginUser(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || !email.contains('@')) {
      _showSnackBar(context, 'Invalid email address');
    } else if (password.isEmpty) {
      _showSnackBar(context, 'Password is required');
    } else {
      Services obj = ServiceImp();
      try {
        obj.signin(
          mail: emailController.text,
          pass: passwordController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } catch (e) {
        _showSnackBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CircularParticleScreen(),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.7),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Dejavu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32, // Increased font size
                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: emailController,
                      cursorColor: Colors.red,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      cursorColor: Colors.red,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // Toggle password visibility
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText:
                          !_passwordVisible, // Toggle password visibility
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ForgotPasswordPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _loginUser(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20, // Increased font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    RegisterPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      // style: ButtonStyle(
                      //   backgroundColor:
                      //       MaterialStateProperty.all(Colors.black),
                      //   foregroundColor: MaterialStateProperty.all(Colors.red),
                      //   side: MaterialStateProperty.all(BorderSide(
                      //     color: Colors.red, // Border color
                      //     width: 1.0, // Border width
                      //   )),
                      // ),
                      child: Text(
                        'Don\'t have an account? Register Here',
                        style: TextStyle(
                          fontSize: 16, // Increased font size
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularParticleScreen extends StatelessWidget {
  const CircularParticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        key: UniqueKey(),
        child: CircularParticle(
          awayRadius: 80,
          numberOfParticles: 200,
          speedOfParticles: 1,
          height: screenHeight,
          width: screenWidth,
          onTapAnimation: true,
          particleColor: Colors.white.withAlpha(150),
          awayAnimationDuration: Duration(milliseconds: 1000),
          maxParticleSize: 8,
          isRandSize: true,
          isRandomColor: true,
          randColorList: [
            Colors.red.withAlpha(210),
            Colors.white.withAlpha(210),
            Colors.yellow.withAlpha(210),
            Colors.green.withAlpha(210),
          ],
          awayAnimationCurve: Curves.easeInOutBack,
          enableHover: true,
          hoverColor: Colors.white,
          hoverRadius: 90,
          connectDots: true,
        ),
      ),
    );
  }
}
