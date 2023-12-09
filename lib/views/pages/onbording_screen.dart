
import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/onbording_item_widgit.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
 
   
  
  @override
  Widget build(BuildContext context) {
    
    const sizedBox = SizedBox(height: 10,);
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:  Column( 
          children: [
            
           const Expanded(child: OnbordingItem()),
            sizedBox,
            const AppButton( 
              backgroundcolor:true,
              filltext:"Create Account",
            
            ),
            AppButton(backgroundcolor:false,filltext:"Already Have An Account (skip to Home page)",
            onPrised: ()=>Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.home),
            ),
            
          ]
          ),
      ),
    );
  }
}

