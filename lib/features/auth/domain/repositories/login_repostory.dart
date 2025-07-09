import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {    
  Future<Either<Failure, UserEntity>> login(String email, String password);
}