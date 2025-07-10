import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_app/features/auth/domain/repositories/login_repostory.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return loginRepository.login(email, password);
  }
}