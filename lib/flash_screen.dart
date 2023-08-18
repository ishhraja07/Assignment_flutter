import 'package:assignment/home_page.dart';
import 'package:flutter/material.dart';

import 'main.dart';
class flash_screen extends StatefulWidget {
  const flash_screen({super.key});

  @override
  State<flash_screen> createState() => _flash_screenState();
}

class _flash_screenState extends State<flash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1500),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset('lib/images/flash.png')
        ),
      ),
    );

  }
}
