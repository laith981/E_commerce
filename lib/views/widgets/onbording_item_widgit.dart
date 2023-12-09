import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../models/onboarding_model.dart';

class OnbordingItem extends StatefulWidget {

  const OnbordingItem({super.key, });
 
 
  @override
  State<OnbordingItem> createState() => OnbordingItemtState();
}

class OnbordingItemtState extends State<OnbordingItem> {
  final PageController pc=PageController();
   int _currentIndex=0;
 
  
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: SizedBox(
            height: 400,
            child: PageView.builder(
              onPageChanged: (i) {
                setState(() {
                 _currentIndex=i;
                });
              },
              controller: pc,
              itemCount: OnbordingModelItem.length,
              
              
              itemBuilder: (context , i){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 250,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                            imageUrl: OnbordingModelItem[i].imageUrl,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                         ),
                    ),
                    const SizedBox(height: 10,),
                    
                    Text(OnbordingModelItem[i].description,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10,),
                    Text("Urna amte, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.",
                    style:Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.grey
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
                   
          
                  ],
                  
                );
                
          
              }
              ),
          ),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: kIsWeb?true:false,
              child: IconButton(
                onPressed:kIsWeb? (){
                  if(_currentIndex >0){
                      _currentIndex--;
                       pc.animateToPage(
                            _currentIndex,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                          );
                    
                  }
                } :(){},
                 icon:const Icon(Icons.arrow_back_ios) 
                 ),
            ),
            SmoothPageIndicator(  
                controller: pc,    
                 count: OnbordingModelItem.length,
                 effect: const WormEffect(),    
                 
                 ),
                 Visibility(
                  visible: kIsWeb?true:false,
                   child: IconButton
                   (onPressed:kIsWeb? (){
                     if(_currentIndex < OnbordingModelItem.length){
                      _currentIndex++;
                      pc.animateToPage(
                        _currentIndex, 
                        duration: const Duration(microseconds: 400),
                         curve: Curves.fastOutSlowIn
                         );
                    
                                 }
                   }:(){},
                    icon: const Icon(Icons.arrow_forward_ios)
                    ),
                 ),

          ]
        ) , 



      ],
    );
  }
}
      
 