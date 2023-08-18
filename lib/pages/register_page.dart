import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modern_login_page/components/my_button.dart';
import 'package:modern_login_page/components/my_textfield.dart';
import 'package:modern_login_page/components/square_title.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final EmailController= TextEditingController();
  final confirmpasswordController=TextEditingController();
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
                const SizedBox(height: 25,),
                const Icon(Icons.lock,
                  size: 50,
                ),
                const SizedBox(height: 50,),
                Text('Let\'s create an account for you!',
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
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text('Forgot Password?',
                //         style: TextStyle(color: Colors.grey[600]),),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20,),
                MyButton(
                  onTap: signUserUp,
                  check: 'Sign Up',
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
                        onTap: (){},imagePath: 'lib/images/apple.png')
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),),
                    SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('LogIn now',
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

  void signUserUp() async{
    showDialog(context: context, builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });

    try{
     if(passwordController.text==confirmpasswordController.text){
       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: EmailController.text, password: passwordController.text);
       Navigator.pop(context);
     }
     else{
       Navigator.pop(context);
       showErrorMessage('Passwords don\'t match');
     }
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
