import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFeild({super.key,required this.controller ,required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText,border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38
        ),
       
        
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38
        ),
      ),
      ),
      validator: (val) { 
        if (val == null || val.isEmpty)
        {
          return 'Enter the $hintText';
        }
        return null;

      },
    );
  }
}