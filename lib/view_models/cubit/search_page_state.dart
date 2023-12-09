part of 'search_page_cubit.dart';

@immutable
sealed class SearchPageState {
 const SearchPageState();
}

final class SearchPageInitial extends SearchPageState {}

final class SearchPageLoading extends SearchPageState {}

final class SearchPageLoaded extends SearchPageState {
  final List<LastSarschModel> lastSarsch;
  final List<PopularSearchModel> popularSearch;
  const SearchPageLoaded({required this.lastSarsch, required this.popularSearch});
}

final class SearchPageError extends SearchPageState {
  final String message;
  const SearchPageError({required this.message});
}
