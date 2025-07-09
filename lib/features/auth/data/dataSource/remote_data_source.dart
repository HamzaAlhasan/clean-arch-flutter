import 'package:clean_arch_app/core/api/api_consumer.dart';
import 'package:clean_arch_app/core/api/end_pionts.dart';
import 'package:clean_arch_app/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSource({required this.apiConsumer});

  Future<UserModel?> login(String email, String password) async {
      final response = await apiConsumer.post(EndPoints.login, body: {'email': email, 'password': password});
      return UserModel.fromJson(response);
  }
}