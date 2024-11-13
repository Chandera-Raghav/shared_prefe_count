import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/login_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String increment = "";
  @override
  void initState() {
    super.initState();
    _getPrefesInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  increment%3==0 ? Colors.primaries[Random().nextInt(Colors.primaries.length)] : Colors.white,
      body:Column(children: [
      Center(
        child: ElevatedButton(onPressed: () async{
          SharedPreferences prefes = await SharedPreferences.getInstance();
          await prefes.clear();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPageScreen()));
        }, child: const Text("Logout")),
      ),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(increment),
        )
    ])
    );
  }
  void _getPrefesInt () async{
    SharedPreferences prefes = await SharedPreferences.getInstance();
    int incrementer = (prefes.getInt('_incrementer') ?? 0) + 1;
    increment = "$incrementer";
    setState(() {

    });
  }

}
