part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignUpLoading extends SignupState {}

class SignUpSucess extends SignupState {}

class SignUpFailed extends SignupState {
  final AppExceptions exceptions;
  const SignUpFailed(this.exceptions);
}
