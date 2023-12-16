import 'package:e_commerce_app_ui/view_models/cart_page_cubit/cart_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CartPageCubit, CartPageState>(
      builder: (context, state) { 
         if(state is CartPageLoading){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        else if(state is CartPageError){
          return Center(
            child: Text(state.message),
          );
        }  
        else if (state is CartPageLoaded){
          return ListView.builder(
            itemCount: state.cartList.length,
            itemBuilder: (context,i)=> Column(
                children: [
                  Container(),
                  const SizedBox(height: 10,)
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