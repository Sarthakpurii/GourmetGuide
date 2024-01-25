import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key,required this.setScreen});

  final void Function(String identifier) setScreen;

  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: Color(0xFF35155D),
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
            children: [
              Icon(Icons.food_bank_outlined),
              const SizedBox(
                width: 10,
              ),
              Text('Let me Cook!',
                style: GoogleFonts.satisfy(
                  fontSize: 24
                ),)
            ],
          )),
          ListTile(
            title: Text(
              'Meals',
              style:
                  GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),
            ),
            onTap: (){setScreen('meals');},
          ),
          ListTile(
            title: Text(
              'Filters',
              style:
                  GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),
            ),
            onTap: (){setScreen('filters');},
          ),
        ],
      ),
    );
  }
}
