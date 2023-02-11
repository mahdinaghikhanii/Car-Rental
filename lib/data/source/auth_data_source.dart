import 'package:car/data/common/http_respone_validator.dart';
import 'package:car/data/entity/auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthDataSource {
  Future<void> verifyOTP();
  Future<void> verifyPhone({required String number});
}

class AuthDataSource with HttpResponseValidator implements IAuthDataSource {
  @override
  Future<void> verifyOTP() {
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhone({required String number}) async {
    // Using valuNotifier for state Auth codeAutoRetrievalTimeout
    // 1 verificationFailed
    // 2 codeSent
    //3 codeAutoRetrievalTimeout
    //4 verificationCompleted
    var respone = await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 10),
        verificationCompleted: (PhoneAuthCredential credential) =>
            AuthEntity().valueNotifier.value = 4,
        verificationFailed: (FirebaseAuthException e) =>
            AuthEntity().valueNotifier.value = 1,
        codeSent: (String verificationId, int? resendToken) {
          AuthEntity().valueNotifier.value = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) =>
            AuthEntity().valueNotifier.value = 3);

    //validateResponse();
  }
}
