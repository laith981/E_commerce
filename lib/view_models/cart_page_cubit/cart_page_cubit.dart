import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/item_card_model.dart';
import 'package:meta/meta.dart';

part 'cart_page_state.dart';

class CartPageCubit extends Cubit<CartPageState> {
  CartPageCubit() : super(CartPageInitial());
  void getCartPageData(){
    emit(CartPageLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(CartPageLoaded(cartList:itemCardLIst.where((item) => item.addToCart).toList() ));
    });
}
}
