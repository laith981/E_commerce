import 'package:e_commerce_app_ui/utils/app_router.dart';
import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: AppColors().grey1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: AppColors().grey1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: AppColors().grey1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: AppColors().red))),
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
