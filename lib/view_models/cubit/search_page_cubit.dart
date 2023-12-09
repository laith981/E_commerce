import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_ui/models/last_sarsch_model.dart';
import 'package:e_commerce_app_ui/models/popular_search_model.dart';
import 'package:meta/meta.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit() : super(SearchPageInitial());
  void getSearchPageData(){
    emit(SearchPageLoaded(lastSarsch: LastSarschList,popularSearch: PopularSearchList));
  }
}
