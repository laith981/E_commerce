import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/view_models/cart_page_cubit/cart_page_cubit.dart';
import 'package:e_commerce_app_ui/view_models/category_cubit/category_cubit.dart';
import 'package:e_commerce_app_ui/view_models/favarite_cubit/favarite_page_cubit.dart';
import 'package:e_commerce_app_ui/views/pages/home_page.dart';
import 'package:e_commerce_app_ui/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_routes.dart';
import '../../utils/color/app_color.dart';
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
        BlocProvider(create: (context) {
          final cubit = CategoryCubit();
          cubit.getcategoryPageData();
          return cubit;
        })
      ],
      child: const HomePAge(),
    ),
     BlocProvider(
      create: (context) {
        final cubit =CartPageCubit();
        cubit.getCartPageData();
        return cubit;
      },
      child: const CartPage(),
    ),
    BlocProvider(
      create: (context) {
        final cubit = FavaritePageCubit();
        cubit.getFavaritePageData();
        return cubit;
      },
      child: const FavaritePage(),
    ),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _currentIndex == 0
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                    imageUrl:
                        "https://i1.sndcdn.com/avatars-000461411799-h3iy7v-t240x240.jpg"),
              )
            : null,
        title: _currentIndex != 2
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hi,jonathan",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Lest's go shopping",
                    style: TextStyle(fontSize: 10, color: AppColors().grey),
                  ),
                ],
              )
            : const Text(
                "My Favarite",
                style: TextStyle(fontSize: 15),
              ),
        actions: _currentIndex == 0
            ? [
                IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pushNamed(
                        AppRoutes.searchPage,
                      );
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications)),
              ]
            : _currentIndex == 2
                ? [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications)),
                  ]
                : null,
      ),
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
