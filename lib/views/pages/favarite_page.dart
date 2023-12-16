import 'package:e_commerce_app_ui/view_models/favarite_cubit/favarite_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_routes.dart';
import '../../utils/color/app_color.dart';
import '../widgets/item_card_widget.dart';

class FavaritePage extends StatefulWidget {
  const FavaritePage({super.key});

  @override
  State<FavaritePage> createState() => _FavaritePageState();
}

class _FavaritePageState extends State<FavaritePage> {
  final List<String> categore=const ["All","Latest","Most Popular","Cheapest"];
  int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavaritePageCubit, FavaritePageState>(
      builder: (context, state) {
        if(state is FavaritePageLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        else if(state is FavaritePageError){
          return Center(
            child: Text(state.message),
          );
        }
        else if (state is FavaritePageLoaded){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    hintText: "Search something... ",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors().grey),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.format_align_left_sharp),
                  )),
                  const SizedBox(height: 25,),
                  SizedBox(
                    height: 40,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categore.length,
                        itemBuilder: (context,i)=>
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                  _currentIndex=i;
                                });
                                  
                                },
                                child:Container(
                                  padding: const EdgeInsets.symmetric(vertical : 10,horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: _currentIndex==i?null:Border.all(color: AppColors().grey),
                                    color: _currentIndex==i? Theme.of(context).primaryColor:null,
                                    ),
                                 child: Text(categore[i],style: TextStyle(color: _currentIndex==i?AppColors().white:AppColors().grey),)
                                ) ,
                              ),
                              const SizedBox(width: 5,)
                            ],
                          )
                        
                        ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                Expanded(
                  child: GridView.builder(
                    itemCount: state.favariteLaist.length,
                    shrinkWrap: true,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: MediaQuery.of(context).size.width > 800 ? 400 : 310,
                      crossAxisCount: 2,
                      mainAxisSpacing:10 ,
                      crossAxisSpacing: 10
                      ), 
                    itemBuilder: (context,index){
                      return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(AppRoutes.productDetailsPage,arguments:index );
                              },
                              child: ItemCardWidget(
                                  name: state.favariteLaist[index].name,
                                  categore: state.favariteLaist[index].categore,
                                  prise: state.favariteLaist[index].prise,
                                  imageUrl: state.favariteLaist[index].imageUrl,
                                   index: index, 
                                   ),
                            );
                    }
                    ),
                ),
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