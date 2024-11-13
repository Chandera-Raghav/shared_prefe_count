// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/login_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int increment = 0;
  @override
  void initState() {
    super.initState();
    _getPrefesInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  increment%3==0 ? Colors.red : Colors.white,
      body:Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: ElevatedButton(onPressed: () async{
          SharedPreferences prefes = await SharedPreferences.getInstance();
          await prefes.clear();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPageScreen()));
        }, child: const Text("Logout")),
      ),
        Container(
          color: Colors.green,
          width: 50,
          alignment: Alignment.center,
          child: Text("$increment", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black87),),
        )
    ])
    );
  }
  void _getPrefesInt () async{
    SharedPreferences prefes = await SharedPreferences.getInstance();
    increment = prefes!.getInt('_incrementer') ?? 0;
    increment++;
    prefes!.setInt('_incrementer', increment);
    setState(() {

    });
  }

}
