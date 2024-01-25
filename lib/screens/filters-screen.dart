
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget{
  FilterScreen({super.key});

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
  Widget build(context){
    return Scaffold(
      appBar: AppBar(title: Text('Available Filters'),),
      body: Column(
        children: [
          SwitchListTile(value: _isGluttenFree,
            onChanged: (isChecked){
              setState(() {
                _isGluttenFree=isChecked;
              });
            },
            title: Text('Glutten-Free',style: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),),
            subtitle: Text('Only include Glutten-Free recipes',style: TextStyle(color: Colors.white),),),

          SwitchListTile(value: _isLactoseFree,
            onChanged: (isChecked){
              setState(() {
                _isLactoseFree=isChecked;
              });
            },
            title: Text('Lactose-Free',style: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),),
            subtitle: Text('Only include Lactose-Free recipes',style: TextStyle(color: Colors.white),),),

          SwitchListTile(value: _isVeg,
            onChanged: (isChecked){
              setState(() {
                _isVeg=isChecked;
              });
            },
            title: Text('Vegetarian',style: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),),
            subtitle: Text('Only include Vegetarian recipes',style: TextStyle(color: Colors.white),),),

          SwitchListTile(value: _isVegan,
            onChanged: (isChecked){
              setState(() {
                _isVegan=isChecked;
              });
            },
            title: Text('Vegan',style: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),),
            subtitle: Text('Only include Vegan recipes',style: TextStyle(color: Colors.white),),),
        ],
      )
    );
  }
}