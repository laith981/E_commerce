// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/item_card_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../models/home_carousel_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void favariteButton(String itemId){
    final index=itemCardLIst.indexWhere((item) => item.id==itemId);
    itemCardLIst[index]=itemCardLIst[index].copyWith(
      isFavorite: !itemCardLIst[index].isFavorite
    ); 
    emit(HomeLoaded(products:itemCardLIst , carouselItem:carouselList ));
  }
  void getHomeData(){
    emit( HomeLoading());
    Future.delayed(const Duration(seconds: 2),(){
      emit(HomeLoaded(products:itemCardLIst , carouselItem:carouselList ));
    });
  }
}
