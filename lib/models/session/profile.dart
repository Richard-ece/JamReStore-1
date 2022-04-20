class Profile {
  final int id;
  final String username;
  final String email;

  Profile({
    required this.id,
    required this.email,
    required this.username,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }
}
