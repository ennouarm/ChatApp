import 'package:flutter/material.dart';
import 'package:newproj3/Pages/Login_page.dart';
import 'package:newproj3/Pages/Register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool ShowLogin = true;

  void toggle(){
    setState(() {
      ShowLogin = !ShowLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(ShowLogin){
      return LoginPage(
        onTap: toggle,
      );
    }else{
      return RegisterPage(
        onTap: toggle,
      );
    }
  }
}
