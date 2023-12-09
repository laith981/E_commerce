import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({super.key, required this.name, required this.categore, required this.prise, required this.imageUrl});
  final String name;
  final String categore;
  final String imageUrl;
  final double prise;

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Container(
          height: 1000,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  ),
              ),
              Text(name,
              style: const TextStyle(
                
                fontSize: 20
              ),
              ),
              Text(categore,
              style:  const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
              ),
              Text("$prise\$",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              
             
            ],
          ),
        ),
        Positioned(
          top:10 ,
          right: 10, 
          child: Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color:AppColors().grey ,
              ),
              
              child: IconButton(
                onPressed: (){},
                 icon: const Icon(Icons.favorite_border) 
                 ),
            ),
          )
          )
      ],
    );
  }
}