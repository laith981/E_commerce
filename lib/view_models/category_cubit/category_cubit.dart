import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/category_card_model.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  void getcategoryPageData(){
    emit(CategoryLoaded(CategoreList: categoreCardData));
  }
}
