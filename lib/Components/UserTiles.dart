import 'package:flutter/material.dart';
class UserTiles extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTiles({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 20,),
            Text(text),
          ],
        ),
      ),

    );
  }
}
