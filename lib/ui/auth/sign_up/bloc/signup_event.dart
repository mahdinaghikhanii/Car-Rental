part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpContinueButtonClicked extends SignupEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  const SignUpContinueButtonClicked(
      this.firstName, this.lastName, this.phoneNumber);
}
