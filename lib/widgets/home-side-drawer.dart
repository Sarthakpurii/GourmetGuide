
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget{
  SideDrawer({super.key});

  @override
  Widget build(context){
    return Drawer(
      backgroundColor: Color(0xFF35155D),
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Icon(Icons.food_bank_outlined),
                const SizedBox(width: 10,),
                Text('Let me Cook!')
              ],
            ))
        ],
      ),
    );
  }
}