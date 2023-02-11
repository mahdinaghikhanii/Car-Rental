import 'package:car/common/exceptions.dart';
import 'package:car/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthRepository authRepository;
  SignupBloc(this.authRepository) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignUpContinueButtonClicked) {
        try {
          emit(SignUpLoading());
          final respone = authRepository.verifyPhone(number: event.phoneNumber);
          SignUpSucess();
        } catch (e) {
          emit(SignUpFailed(AppExceptions()));
        }
      }
    });
  }
}
