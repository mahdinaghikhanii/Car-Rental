import 'package:car/common/exceptions.dart';
import 'package:car/data/repo/allcar_repo.dart';
import 'package:car/ui/home/bloc/home_event.dart';
import 'package:car/ui/home/bloc/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IAllCarRepository repository;
  HomeBloc(this.repository) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          await Future.delayed(Duration(seconds: 2));
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
