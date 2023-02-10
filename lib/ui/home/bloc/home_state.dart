import 'package:car/common/exceptions.dart';
import 'package:car/data/entity/car_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailed extends HomeState {
  final AppExceptions exceptions;
  const HomeFailed(this.exceptions);
}

class HomeSucess extends HomeState {
  final List<CarEntity> carEntity;
  const HomeSucess(this.carEntity);
}
