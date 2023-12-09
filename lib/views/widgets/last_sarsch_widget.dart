import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';

class LastSarschWidget extends StatelessWidget {
  const LastSarschWidget({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      
      decoration: BoxDecoration(
        border: Border.all( color: AppColors().grey),
        borderRadius: BorderRadius.circular(10)
      ),
      child:Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey
              ),
              ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: (){},
             icon: const Icon(Icons.clear_rounded,color: Colors.grey,size: 15,)
             )
        ],
      ) ,
    );
  }
}