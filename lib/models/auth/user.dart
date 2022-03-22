class User {
  final String email;
  final String password;

  User({
    required this.email,
    required this.password,
  });
}

class UserSignIn extends User {
  UserSignIn({
    required String password,
    required String email,
  }) : super(
          password: password,
          email: email,
        );
}

class UserSignUp extends User {
  final String name;

  UserSignUp({
    required this.name,
    required String password,
    required String email,
  }) : super(
          password: password,
          email: email,
        );
}
