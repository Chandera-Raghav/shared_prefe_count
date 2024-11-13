import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/home_page.dart';
import 'package:untitled2/login_page.dart';

class FlashePageScreen extends StatefulWidget {
  const FlashePageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _FlashePageScreenState();
}
class _FlashePageScreenState extends State<FlashePageScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async{
      SharedPreferences prefes = await SharedPreferences.getInstance();
      bool check = prefes.getBool(LoginPageScreen.LOGIN_KEY) ?? false;
      Widget navigateTo = const LoginPageScreen();
      if(check){
        navigateTo = const HomePageScreen();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> navigateTo));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.redAccent,),
    );
  }
}