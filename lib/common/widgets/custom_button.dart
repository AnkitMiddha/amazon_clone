import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize:  const Size(double.infinity, 50),
       backgroundColor: GlobalVariables.secondaryColor,
       
       

        
      ),
       child:  Text(text,style:const TextStyle(color: GlobalVariables.backgroundColor),),
    );
  }
}
