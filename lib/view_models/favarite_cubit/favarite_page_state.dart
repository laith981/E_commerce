part of 'favarite_page_cubit.dart';

@immutable
sealed class FavaritePageState {
  const FavaritePageState();
}

final class FavaritePageInitial extends FavaritePageState {}
final class FavaritePageLoading extends FavaritePageState {}

final class FavaritePageLoaded extends FavaritePageState {
  final List<ItemCardModel> favariteLaist;
  const FavaritePageLoaded({required this.favariteLaist});
}

final class FavaritePageError extends FavaritePageState {
  final String message;
  const FavaritePageError({required this.message});
}
