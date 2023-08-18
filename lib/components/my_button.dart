import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String check;
  const MyButton({Key? key, required this.onTap, required this.check}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(color: Colors.black,
        borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(check,
          style: TextStyle(color:Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16),),),
      ),
    );
  }
}
