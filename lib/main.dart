import 'package:e_commerce_app_ui/utils/app_router.dart';
import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primaryColor: Colors.purple,
               
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.onbordingscreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}



  

