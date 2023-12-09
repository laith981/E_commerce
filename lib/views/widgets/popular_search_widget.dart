import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/models/popular_search_model.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';

class PopularSearchWidget extends StatelessWidget {
  const PopularSearchWidget({super.key, required this.imageUrl, required this.name, required this.searchTimes, required this.tipe});
 final String imageUrl;
 final String name;
 final String searchTimes;
 final String tipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              errorWidget:(context,url,error)=>const Icon(Icons.error) ,
              ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                style: Theme.of(context).textTheme.labelLarge
                ),
                const SizedBox(height: 5,),
                Text(
                  "$searchTimes Search today",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors().grey
                  ),
                  ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical:10,horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: tipe==Tipe().hot?const Color.fromARGB(255, 218, 115, 115):tipe==Tipe().popular?const Color.fromARGB(255, 111, 226, 171):tipe==Tipe().newTipe?const Color.fromARGB(255, 238, 177, 97):null
              ),
              child: Text(tipe,
              style: TextStyle(
                 color: tipe==Tipe().hot?Colors.red:tipe==Tipe().popular?Colors.green:tipe==Tipe().newTipe?Colors.orange:null
              ),
              )
              ),

      
          ]
          ),
      ),
    );
  }
}