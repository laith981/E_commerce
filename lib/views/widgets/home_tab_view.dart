import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/utils/app_routes.dart';
import 'package:e_commerce_app_ui/view_models/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'item_card_widget.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state) {
        if(state is HomeLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        else if(state is HomeError){
          return Center(
            child: Text(state.message),
          );
        }
        else if (state is HomeLoaded){
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              FlutterCarousel(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.width > 800 ? 400 : 200,
                  viewportFraction: 1,
                  showIndicator: true,
                  slideIndicator:  CircularWaveSlideIndicator(),
                ),
                items: state.carouselItem.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          child:CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl :i.imageUrl,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ) ,
                          );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text("New Arrifals "),
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: Color.fromARGB(255, 255, 127, 7),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See All",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent:
                        MediaQuery.of(context).size.width > 800 ? 400 : 310,
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 4 : 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.productDetailsPage,arguments:i );
                      },
                      child: ItemCardWidget(
                          name: state.products[i].name,
                          categore: state.products[i].categore,
                          prise: state.products[i].prise,
                          imageUrl: state.products[i].imageUrl),
                    );
                  })
            ],
          ),
        );
        }
        else{
          return const Center(
            child: Text(
              "Error",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 50
              ),
            ),
          );
        }
      },
    );
  }
}
