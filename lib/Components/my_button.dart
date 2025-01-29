import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const myButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container
          (
        padding: const EdgeInsets.all(18),
          margin: EdgeInsets.symmetric(horizontal: 25),

          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)),
          child:
          Center(
            child:
            Text(
              text,
              style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold),), )
          ,),
    );

  }
}
