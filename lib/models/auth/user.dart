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

class Password {
  final String email;
  final String password;

  Password({
    required this.password,
    required this.email,
  });
}

class UserSignUp extends User {
  final String name;

  UserSignUp({
    required this.name,
    required String password,
    required String email,
    required String confirmedEmail,
  }) : super(
          password: password,
          email: email,
        );
}

class EditAccount extends User {
  final String name;

  EditAccount({
    required this.name,
    required String password,
    required String email,
  }) : super(
          password: password,
          email: email,
        );
}

class ProfileAccount {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const ProfileAccount({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
  });
}

class NumberPhone {
  final String number;
  final String country;

  NumberPhone({required this.number, required this.country});
}

class Code {
  final String code;
  Code({required this.code});
}
