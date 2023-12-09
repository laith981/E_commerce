import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/item_card_model.dart';
import 'package:meta/meta.dart';

part 'product_details_page_state.dart';

class ProductDetailsPageCubit extends Cubit<ProductDetailsPageState> {
  ProductDetailsPageCubit() : super(ProductDetailsPageInitial());
  void getProductDetailsPageData(){
    emit(ProductDetailsPageLoaded(item: itemCardLIst));
  }
}
