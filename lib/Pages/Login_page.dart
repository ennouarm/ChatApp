import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproj3/Components/my_button.dart';
import '../Components/my_textfield.dart';
import '../Services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});
  void login (BuildContext context) async {
    // auth service
    final authService = AuthService();
    // try login
    try{
      await authService.signInWithEmailAndPassword(_emailController.text, _pwController.text);
    }
    catch(e){
      showDialog(context: context,
          builder: (context) =>AlertDialog(
            title: Text(e.toString()),
          )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
            //logo
            Center(
              child: SvgPicture.asset('lib/assets/images/iconmonstr-speech-bubble-33.svg',
              width: 100.0,
              height: 100.0,
              color: Theme.of(context).colorScheme.primary
                ,),
            ),
        SizedBox(height: 20,),
        //welcome back message
          Text("Welcome Back to ChatUp", style: TextStyle(fontSize: 25),),
           SizedBox(height: 20,),
        //email textfield
           myTextField(
             hintText: 'Email',
             obscureText: false,
             controller: _emailController,),
           SizedBox(height: 20,),
           //pw textfield
           myTextField(
             hintText: 'password',
             obscureText: true,
             controller: _pwController,),
           SizedBox(height: 20,),
        //login button

          myButton(
            text: 'Login',
            onTap: () => login(context),
          ),
           SizedBox(height: 20,),
        // regiter button
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 "Not a member? ",
                 style: TextStyle(color: Theme.of(context).colorScheme.primary),),

               GestureDetector(
                 onTap: onTap,
                 child: Text(
                     "Register Now",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Theme.of(context).colorScheme.primary),),
               ),

             ],
           )
         ],

        ),
      ),
    );
  }
}
