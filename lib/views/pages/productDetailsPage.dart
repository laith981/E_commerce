import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:e_commerce_app_ui/view_models/product_details_page_cubit/product_details_page_cubit.dart';
import 'package:e_commerce_app_ui/views/widgets/number_widget.dart';
import 'package:e_commerce_app_ui/views/widgets/prise_widget.dart';
import 'package:e_commerce_app_ui/views/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item_card_model.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.index});
  final int index;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ValueNotifier<int> _numberValueNotifier = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProductDetailsPageCubit();
        cubit.getProductDetailsPageData();
        return cubit;
      },
      child: BlocBuilder<ProductDetailsPageCubit, ProductDetailsPageState>(
        builder: (context, state) {
          if(state is ProductDetailsPageLoading){
            return const CircularProgressIndicator();
          }
          else if(state is ProductDetailsPageError){
            return Center(child :Text(state.message));
          }
          else if(state is ProductDetailsPageLoaded){
             return Scaffold(
              body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: CachedNetworkImageProvider(
                  state.item[widget.index].imageUrl),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Text(
                      " Detail Product",
                      style: TextStyle(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                           setState(() {
                    itemCardLIst[widget.index]=itemCardLIst[widget.index].copyWith(
                      isFavorite:!itemCardLIst[widget.index].isFavorite
                    );
                  });
                        },
                        icon:itemCardLIst[widget.index].isFavorite? Icon(
                  Icons.favorite_sharp,
                  color:AppColors().favariteIconColor
                  ): 
                  const Icon(Icons.favorite_border)
                  )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    state.item[widget.index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 197, 163, 40),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          "${state.item[widget.index].evaluation} "),
                                      Text(
                                        "(320 Review)",
                                        style:
                                            TextStyle(color: AppColors().grey),
                                      ),
                                    ],
                                  )
                                ]),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey),
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              _decrementNumber();
                                            },
                                            icon: const Icon(Icons.remove)),
                                        NumberWidget(
                                            number: _numberValueNotifier),
                                        IconButton(
                                            onPressed: () {
                                              _incrementNumber();
                                            },
                                            icon: const Icon(Icons.add)),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Avaliable in stak",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Size",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizeWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.item[widget.index].description)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                            children:[ 
                              Text("\$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor)
                                    ),
                                    PriseWidget(quantity: _numberValueNotifier, prise: state.item[widget.index].prise)
                                    ]
                                    ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: AppColors().white),
                            onPressed: () {},
                            child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_bag_outlined),
                                  Text("Add to Cart")
                                ])),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
          }
          else{
            return const Center(child :Text("Error page"));
          }
         
        },
      ),
    );
  }

  void _incrementNumber() {
    _numberValueNotifier.value++;
  }

  void _decrementNumber() {
    if (_numberValueNotifier.value > 1) {
      _numberValueNotifier.value--;
    }
  }
}