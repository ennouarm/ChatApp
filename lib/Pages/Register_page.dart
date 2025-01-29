import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Components/my_button.dart';
import '../Components/my_textfield.dart';
import '../Services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _ConfrimPwController = TextEditingController();
  final void Function()? onTap;
 RegisterPage({super.key, required this.onTap});
  void Register(BuildContext context){
    final authService = AuthService();
    if (_pwController.text == _ConfrimPwController.text){
      try {
        authService.signUpWithEmailAndPassword(_emailController.text, _pwController.text);
      } catch (e){
        showDialog(context: context,
            builder: (context) =>AlertDialog(
            title: Text(e.toString()),),);
      }
    }else{
    showDialog(context: context,
    builder: (context) =>AlertDialog(
    title: Text("Passwords don't Match"),),);
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
            Center(child: SvgPicture.asset(
              'lib/assets/images/iconmonstr-speech-bubble-33.svg',
              width: 100.0,
              color: Theme.of(context).colorScheme.primary,
            ),),
            SizedBox(height: 20,),
            //welcome back message
            Text("Let's create an account for you", style: TextStyle(fontSize: 20),),
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
            //pw textfield
            myTextField(
              hintText: 'confirm password',
              obscureText: true,
              controller: _ConfrimPwController,),
            SizedBox(height: 20,),

            myButton(
              text: 'Register',
              onTap: () => Register(context),),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style : TextStyle(color: Theme.of(context).colorScheme.primary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),),
                ),

              ],
            )
          ],

        ),
      ),
    );;
  }
}
