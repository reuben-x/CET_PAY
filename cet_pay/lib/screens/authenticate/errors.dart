class Errors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "This email address is already in use";

      case 'invalid-email':
        return "The email address is invalid";

      case 'operation-not-allowed':
        return "Operation not allowed";

      case 'weak-password':
        return "Password is weak";

      case 'user-disabled':
        return "User account has been disabled";

      case 'user-not-found':
        return "No user found";

      case 'wrong-password':
        return "Email address or password is incorrect.";

      default: print(errorCode);
        return "An error has occurred";
    }
  }
}
