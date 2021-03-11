part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenError extends HomeScreenState {}

class HomeScreenSuccess extends HomeScreenState {
  final Unsplash unsplashlist;
  HomeScreenSuccess({this.unsplashlist});
}
