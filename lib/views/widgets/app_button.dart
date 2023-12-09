import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.backgroundcolor, required this.filltext, this.onPrised, });
  final bool backgroundcolor;
  final String filltext;
  final VoidCallback? onPrised;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPrised ,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundcolor? Theme.of(context).primaryColor:Colors.white,
          borderRadius:BorderRadius.circular(16)
          
    
        ),
        child: Center(
          child: Text(filltext,
          style: TextStyle(
            color: backgroundcolor? Colors.white:Theme.of(context).primaryColor,
          ),
          ),
        ),
    
      ),
    );
  }
}