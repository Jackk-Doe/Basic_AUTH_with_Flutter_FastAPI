import 'dart:convert';

/// [UserAuth] for using with SignIn and SignUp
class UserAuth {
  final String email;
  final String password;
  final String username;

  UserAuth(this.email, this.password, {this.username = ""});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'username': username});
  
    return result;
  }

  factory UserAuth.fromMap(Map<String, dynamic> map) {
    return UserAuth(
      map['email'] ?? '',
      map['password'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuth.fromJson(String source) => UserAuth.fromMap(json.decode(source));
}
