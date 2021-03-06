class Failure implements Exception {
  final String message;

  const Failure({required this.message});
}

/// register status code failure
class RegisterFailure extends Failure {
  const RegisterFailure(String message) : super(message: message);

  factory RegisterFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const RegisterFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const RegisterFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const RegisterFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const RegisterFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const RegisterFailure(
          'Please enter a stronger password.',
        );
      default:
        return const RegisterFailure(
          'An unknown error occurred! try again later.',
        );
    }
  }
}

/// login status code failure
class LoginFailure extends Failure {
  const LoginFailure(String message) : super(message: message);

  factory LoginFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LoginFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LoginFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LoginFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LoginFailure(
          'An unknown error occurred! try again later.',
        );
    }
  }
}

class UnknownFailure extends Failure {
  UnknownFailure({
    String message = 'Unknown error occurred, please try again later',
  }) : super(message: message);
}
