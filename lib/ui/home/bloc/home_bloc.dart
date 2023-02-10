import '../../../common/exceptions.dart';
import '../../../data/repo/allcar_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IAllCarRepository repository;
  HomeBloc(this.repository) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          await Future.delayed(const Duration(seconds: 2));
          emit(HomeLoading());
          final carDataRespone = await repository.getAllCar();
          emit(HomeSucess(carDataRespone));
        } catch (e) {
          emit(HomeFailed(AppExceptions()));
        }
      }
    });
  }
}
