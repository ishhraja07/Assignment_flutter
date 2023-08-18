import 'package:flutter/material.dart';
class SquareTittle extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTittle({Key? key, required this.imagePath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Image.asset(imagePath,height: 40,),
        decoration: BoxDecoration(border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200]),
      ),
    );
  }
}
