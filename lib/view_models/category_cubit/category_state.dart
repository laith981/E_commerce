part of 'category_cubit.dart';

@immutable
sealed class CategoryState {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<CategoreCardModel> CategoreList;
  const CategoryLoaded({required this.CategoreList});
}

final class CategoryError extends CategoryState {
  final String message;
  const CategoryError({required this.message});
}
