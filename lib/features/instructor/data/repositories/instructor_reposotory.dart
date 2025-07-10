import 'package:clean_arch_app/core/errors/expction.dart';
import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/instructor/data/dataSource/remote_data_source.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/courses_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/periods_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/repositories/instructor_repostory.dart';
import 'package:dartz/dartz.dart';

class InstructorRepositoryImpl implements InstructorRepository {
  final InstructorRemoteDataSource instructorRemoteDataSource;

  InstructorRepositoryImpl({required this.instructorRemoteDataSource});

  @override
  Future<Either<Failure, CoursesEntity>> getCourses() async {
    try {
      final courses = await instructorRemoteDataSource.getCourses();
      return Right(courses!);
    } on ServerException catch (e) {
      return Left(Failure(message: e.errorModel.message));
    } catch (e) {
      return Left(Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PeriodsEntity>> getPeriods({String? courseIdFilter, String? filterDate}) async {
    try {
      final periods = await instructorRemoteDataSource.getPeriods(courseIdFilter: courseIdFilter, filterDate: filterDate);
      return Right(periods!);
    } on ServerException catch (e) {
      return Left(Failure(message: e.errorModel.message));
    } catch (e) {
      return Left(Failure(message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}