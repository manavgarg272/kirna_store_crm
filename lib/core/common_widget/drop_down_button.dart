/* 


import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {

   DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return  Container(
      margin:EdgeInsets.all(10),
      child: DropdownButtonFormField( 
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "Slect Category",
          ),
        // Initial Value 
        value: dropdownvalue, 
          
        // Down Arrow Icon 
        icon: const Icon(Icons.keyboard_arrow_down),     
        
        // Array list of items 
        items: items.map((String items) { 
          return DropdownMenuItem( 
            value: items, 
            child: Text(items), 
          ); 
        }).toList(), 
        
        // After selecting the desired option,it will 
        // change button value to selected value 
        onChanged: (String? newValue) {  
          setState(() { 
            dropdownvalue = newValue!; 
          }); 
        }, 
      ),
    ),
  }
} */