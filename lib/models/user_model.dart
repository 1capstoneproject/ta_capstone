class UserModel {
  dynamic id;
  String name;
  String email;
  String? email_verified_at;
  String password;
  dynamic rememberToken;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.email_verified_at,
    required this.password,
    required this.rememberToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      email_verified_at: json['email_verified_at'],
      password: json['password'],
      rememberToken: json['rememberToken'],
    );
  }
}
