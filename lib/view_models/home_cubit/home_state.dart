part of 'home_cubit.dart';

@immutable
sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState{}

final class HomeLoaded extends HomeState{
  final List<ItemCardModel> products;
   final List<HomeCarouselModel> carouselItem;
   const HomeLoaded({
    required this.products, 
    required this.carouselItem
    });
}
final class HomeError extends HomeState{
  final String message;
  const HomeError({required this.message});
}