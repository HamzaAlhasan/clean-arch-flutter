class Failure {
  final String message;
  Failure({required this.message});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}