import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/models/item_card_model.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';


class ItemCardWidget extends StatefulWidget {
  const ItemCardWidget({super.key, required this.name, required this.categore, required this.prise, required this.imageUrl, required this.index,});
  final String name;
  final String categore;
  final String imageUrl;
  final double prise;
  final int index;

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
 
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
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.fill,
                  ),
              ),
              Text(widget.name,
              style: const TextStyle(
                
                fontSize: 20
              ),
              ),
              Text(widget.categore,
              style:  const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
              ),
              Text("${widget.prise}\$",
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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:AppColors().grey ,
            ),
            
            child: IconButton(
              onPressed:(){
                setState(() {
                  itemCardLIst[widget.index]=itemCardLIst[widget.index].copyWith(
                     isFavorite: !itemCardLIst[widget.index].isFavorite
                      ); 
                });
              } ,
               icon:itemCardLIst[widget.index].isFavorite? Icon(
                Icons.favorite_sharp,
                color:AppColors().favariteIconColor
                ): 
                const Icon(Icons.favorite_border) 
               ),
          )
          )
      ],
    );
  }
}