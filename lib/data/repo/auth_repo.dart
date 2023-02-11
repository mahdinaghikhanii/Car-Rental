import 'package:car/data/source/auth_data_source.dart';

abstract class IAuthRepository {
  Future<void> verifyOTP();
  Future<void> verifyPhone({required String number});
}

class AuthRepository implements IAuthRepository {
  AuthDataSource authDataSource;
  AuthRepository(this.authDataSource);
  @override
  Future<void> verifyOTP() {
    return authDataSource.verifyOTP();
  }

  @override
  Future<void> verifyPhone({required String number}) {
    return authDataSource.verifyPhone(number: number);
  }
}
