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
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 36, 11, 46),
                Color.fromARGB(255, 14, 0, 32)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
            ),
              child: Row(
            children: [
              Image.asset('assets/icons/LetmeCook.png',scale: 14,color: Colors.white70,),
              const SizedBox(
                width: 20,
              ),
              Text('Let me Cook !',
                style: GoogleFonts.satisfy(
                  fontWeight: FontWeight.bold,
                  fontSize: 28
                ),)
            ],
          )),
          ListTile(
            leading: Image.asset('assets/icons/meals.png',scale: 20,color: Colors.white70,),
            title: Text(
              'Meals',
              style:
                  GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            onTap: (){setScreen('meals');},
          ),
          ListTile(
            leading: Image.asset('assets/icons/settings.png',scale: 20,color: Colors.white70,),
            title: Text(
              'Filters',
              style:
                  GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            onTap: (){setScreen('filters');},
          ),
        ],
      ),
    );
  }
}
