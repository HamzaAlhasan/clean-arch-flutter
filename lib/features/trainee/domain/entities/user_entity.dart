class UserEntity {
  final String firstName;
  final String familyName;
  final String email;
  final String accessToken;
  final String refreshToken;
  UserEntity({required this.firstName, required this.familyName, required this.email, required this.accessToken, required this.refreshToken});
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      firstName: json['firstName'],
      familyName: json['familyName'],
      email: json['email'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'familyName': familyName,
      'email': email,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}