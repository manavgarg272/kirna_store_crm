import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  String? Function(String?)? validator;
  String ? hintText;
  TextInputType? keyboardType;
  TextEditingController? controller;
  InputTextField({super.key, this.validator,this.hintText,this.keyboardType,this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller ,
        validator: validator,
        keyboardType: keyboardType,
        decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,

          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
        ),
      ),
    );
  }
}
