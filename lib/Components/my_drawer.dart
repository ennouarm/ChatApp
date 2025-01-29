import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Pages/SettingsPage.dart';
import '../Services/auth/auth_service.dart';


class my_drawer extends StatelessWidget {
  logout(){
    final _auth = AuthService();
    _auth.signOut();
  }
  const my_drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Column(    //logo
    children: [
      DrawerHeader(child:
      Center(
        child: SvgPicture.asset(
          'lib/assets/images/iconmonstr-speech-bubble-33.svg',
          width: 60.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      )),
      //home list tile
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: ListTile(
          title:  Text("H O M E"),
          leading: Icon(Icons.home, size: 25.0,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),

      // settings list tile
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: ListTile(
          title:  Text("S E T T I N G"),
          leading: Icon(Icons.settings),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()),);
          },
        ),
      ),
    ],),

          //logout
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title:  Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
