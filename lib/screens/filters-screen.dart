
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Filter {GluttenFree, LactoseFree,Vegetarian,Vegan}

class FilterScreen extends StatefulWidget{
  const FilterScreen({super.key,required this.filterData});

  final Map<Filter,bool> filterData;

  @override
  State<FilterScreen> createState(){
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen>{
  var _isGluttenFree=false;
  var _isLactoseFree=false;
  var _isVeg=false;
  var _isVegan=false;

  @override
  void initState() {
    super.initState();
    _isGluttenFree=widget.filterData[Filter.GluttenFree]!;
    _isLactoseFree=widget.filterData[Filter.LactoseFree]!;
    _isVeg=widget.filterData[Filter.Vegetarian]!;
    _isVegan=widget.filterData[Filter.Vegan]!;
  }

  @override 
  Widget build(context){
    return Scaffold(
      appBar: AppBar(title: Text('Available Filters',style: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.w600)),),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.GluttenFree:_isGluttenFree,
            Filter.LactoseFree: _isLactoseFree,
            Filter.Vegan: _isVeg,
            Filter.Vegetarian: _isVegan
          });
          return false;
        },

        child: Column(
          children: [
            SwitchListTile(value: _isGluttenFree,
              onChanged: (isChecked){
                setState(() {
                  _isGluttenFree=isChecked;
                });
              },
              title: Text('Glutten-Free',style: GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),),
              subtitle: Text('Only include Glutten-Free recipes',style: GoogleFonts.mulish(color: Colors.white),),),
        
            SwitchListTile(value: _isLactoseFree,
              onChanged: (isChecked){
                setState(() {
                  _isLactoseFree=isChecked;
                });
              },
              title: Text('Lactose-Free',style: GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),),
              subtitle: Text('Only include Lactose-Free recipes',style: GoogleFonts.mulish(color: Colors.white),),),
        
        
        
            SwitchListTile(value: _isVeg,
              onChanged: (isChecked){
                setState(() {
                  _isVeg=isChecked;
                });
              },
              title: Text('Vegetarian',style: GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),),
              subtitle: Text('Only include Vegetarian recipes',style: GoogleFonts.mulish(color: Colors.white),),),
        
            SwitchListTile(value: _isVegan,
              onChanged: (isChecked){
                setState(() {
                  _isVegan=isChecked;
                });
              },
              title: Text('Vegan',style: GoogleFonts.mulish(color: Color.fromARGB(255, 240, 95, 73)),),
              subtitle: Text('Only include Vegan recipes',style: GoogleFonts.mulish(color: Colors.white),),),
          ],
        ),
      )
    );
  }
}