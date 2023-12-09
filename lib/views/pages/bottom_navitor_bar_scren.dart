import 'package:e_commerce_app_ui/view_models/category_cubit/category_cubit.dart';
import 'package:e_commerce_app_ui/views/pages/home_page.dart';
import 'package:e_commerce_app_ui/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_models/home_cubit/home_cubit.dart';
import 'cart_page.dart';
import 'favarite_page.dart';

class BottomNvigatorPage extends StatefulWidget {
  const BottomNvigatorPage({super.key});

  @override
  State<BottomNvigatorPage> createState() => _BottomNvigatorPageState();
}

class _BottomNvigatorPageState extends State<BottomNvigatorPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
        ),
        BlocProvider(
          create: (context) {
        final cubit = CategoryCubit();
        cubit.getcategoryPageData();
        return cubit;
      })
      ],
      
      child: const HomePAge(),
    ),
    const CartPage(),
    const FavaritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: pages[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_sharp), label: "Favarite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "My Profile"),
            ]),
      
    );
  }
}
