import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/home_page.dart';

class LoginPageScreen extends StatefulWidget {
  static const String LOGIN_KEY = "login";
  const LoginPageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageScreenState();
}
class _LoginPageScreenState extends State<LoginPageScreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
          SharedPreferences prefes = await SharedPreferences.getInstance();
          prefes.setBool(LoginPageScreen.LOGIN_KEY, true);
          void _incrementCounter() {
            setState(() {
              _counter++;
            });
          }
          prefes.setInt("_incrementer", _incrementCounter as int);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=> const HomePageScreen()));
        }, child: const Text("Login")),
      ),
    );
  }
}