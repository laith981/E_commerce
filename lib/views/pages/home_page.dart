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
    return  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
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
      
    );
  }
}
