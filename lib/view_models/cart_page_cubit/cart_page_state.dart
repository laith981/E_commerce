part of 'cart_page_cubit.dart';

@immutable
sealed class CartPageState {
  const CartPageState();
}

final class CartPageInitial extends CartPageState {}


final class CartPageLoading extends CartPageState {}

final class CartPageLoaded extends CartPageState {
  final List<ItemCardModel> cartList;
  const CartPageLoaded({required this.cartList});
}

final class CartPageError extends CartPageState {
  final String message;
  const CartPageError({required this.message});
}
