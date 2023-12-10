import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:e_commerce_app_ui/view_models/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if(state is CategoryLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        else if(state is CategoryError){
          return Center(
            child: Text(state.message),
          );
        }
        else if(state is CategoryLoaded){
          return SingleChildScrollView(
          child: Column(
            children: state.CategoreList.map((item) {
              return Builder(builder: (BuildContext context) {
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.width > 800 ? 150 : 100,
                      child: Stack(fit: StackFit.expand, children: [
                        CachedNetworkImage(
                          imageUrl: item.imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, erorr) =>
                              const Icon(Icons.error),
                        ),
                        Positioned(
                            top: size.width > 800 ? 40 : 20,
                            left: item.rightTextAlign ? null : 20,
                            right: item.rightTextAlign ? 20 : null,
                            child: Column(
                              children: [
                                Text(
                                  item.categoreTitel,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          color: item.lightTextColor
                                              ? AppColors().white
                                              : AppColors().black,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text("${item.quantity} Product",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: item.lightTextColor
                                                ? AppColors().white
                                                : AppColors().black))
                              ],
                            )),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              });
            }).toList(),
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
