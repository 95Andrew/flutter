
import 'package:bloc/bloc.dart';
import 'package:flutter_app/data/dto/unsplash.dart';
import 'package:flutter_app/data/repository/unsplash_repository.dart';
import 'package:meta/meta.dart';


part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final UnsplashRepository _unsplashRepository;

  HomeScreenCubit(this._unsplashRepository) : super(HomeScreenInitial());

  Future<void> getUnsplash() async {
    try {
      emit(HomeScreenLoading());
      final Unsplash _responseList = await _unsplashRepository.getUnsplash();
      emit(HomeScreenSuccess(unsplashlist: _responseList));
    } catch (_) {
      emit(HomeScreenError());
    }
  }
}
