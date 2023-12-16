import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/item_card_model.dart';
import 'package:meta/meta.dart';

part 'favarite_page_state.dart';

class FavaritePageCubit extends Cubit<FavaritePageState> {
  FavaritePageCubit() : super(FavaritePageInitial());
  void favariteButton(String itemId){
    final index=itemCardLIst.indexWhere((item) => item.id==itemId);
    itemCardLIst[index]=itemCardLIst[index].copyWith(
      isFavorite: !itemCardLIst[index].isFavorite
    ); 
    emit(FavaritePageLoaded(favariteLaist:itemCardLIst.where((item) => item.isFavorite).toList() ));
  }
  void getFavaritePageData(){
    emit(FavaritePageLoading());
    Future.delayed(const Duration(seconds: 1),(){
      emit(FavaritePageLoaded(favariteLaist:itemCardLIst.where((item) => item.isFavorite).toList() ));
    });
    
  }
}
