import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:e_commerce_app_ui/views/widgets/category_tab_view.dart';
import 'package:e_commerce_app_ui/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';


class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> with TickerProviderStateMixin {
  // ignore: prefer_typing_uninitialized_variables
  late final _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                              imageUrl:
                                  "https://i1.sndcdn.com/avatars-000461411799-h3iy7v-t240x240.jpg"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hi,jonathan"),
                            Text("Lest's go shopping"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                         IconButton(
                              onPressed: () {
                                Navigator.of(context,rootNavigator:true )
                                    .pushNamed(AppRoutes.searchPage,);
                              },
                              icon: const Icon(Icons.search)),
                        
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications)),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColors().grey,
                tabs: const [
                  Tab(child: Text("Home")),
                  Tab(child: Text("Category")),
                ]),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [HomeTabView(), CategoryTabView()]),
            ),
          ],
        ),
      ),
    );
  }
}
