import 'package:clean_arch_app/core/errors/expction.dart';
import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/auth/data/dataSource/remote_data_source.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_app/features/auth/domain/repositories/login_repostory.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  LoginRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final user = await authRemoteDataSource.login(email, password);
      return Right(user!);
    } on ServerException catch (e) {
      return Left(Failure(message: e.errorModel.message));
    } catch (e) {
      return Left(Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}