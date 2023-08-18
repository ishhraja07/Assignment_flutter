import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modern_login_page/components/my_button.dart';
import 'package:modern_login_page/components/my_textfield.dart';
import 'package:modern_login_page/components/square_title.dart';
import 'package:modern_login_page/services/auth_service.dart';

class LoginPage extends StatefulWidget {
   final Function()? onTap;

  const LoginPage({super.key, this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final EmailController= TextEditingController();

final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                const Icon(Icons.lock,
                size: 100,
                ),
                const SizedBox(height: 50,),
                Text('Welcome back you\'ve been missed!',
                style: TextStyle(color:Colors.grey[700],fontSize: 18,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25,),
                MyTextField(
                  controller: EmailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10,),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                MyButton(
                 onTap: signUserIn,
                  check:'Sign In',
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or continue with',
                        style: TextStyle(color: Colors.grey[700]),),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTittle(
                        onTap: ()=>AuthService().signInWithGoogle(),
                        imagePath: 'lib/images/google.png'),
                    SizedBox(width: 25,),
                    SquareTittle(
                      onTap: (){},
                        imagePath: 'lib/images/apple.png')
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Not a member?',
                  style: TextStyle(color: Colors.grey[700]),),
                  SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text('Register now',
                    style: TextStyle(
                      color: Colors.blue,fontWeight: FontWeight.bold,
                    ),),
                  )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }

 void signUserIn() async{
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });
   try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text, password: passwordController.text);
     Navigator.pop(context);
   } on FirebaseAuthException catch (e){
     Navigator.pop(context);
     showErrorMessage(e.code);
   }

  }
  void showErrorMessage(String message){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message, style: TextStyle(color: Colors.white),),
          ),
        );
      });

  }
// void wrongPasswordMessage(){
//   showDialog(context: context, builder: (context){
//     return AlertDialog(
//       title: Text('Incorrect Password'),
//     );
//   });
// }
}
