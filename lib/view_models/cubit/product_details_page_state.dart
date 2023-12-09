part of 'product_details_page_cubit.dart';

@immutable
sealed class ProductDetailsPageState {
  const ProductDetailsPageState();
}

final class ProductDetailsPageInitial extends ProductDetailsPageState {}

final class ProductDetailsPageLoading extends ProductDetailsPageState {}

final class ProductDetailsPageLoaded extends ProductDetailsPageState {
  final List<ItemCardModel> item;
  const ProductDetailsPageLoaded({required this.item});
}

final class ProductDetailsPageError extends ProductDetailsPageState {
  final String message;
  const ProductDetailsPageError({required this.message});
}
