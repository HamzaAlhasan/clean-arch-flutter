import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/courses_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/periods_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InstructorRepository {    
  Future<Either<Failure, CoursesEntity>> getCourses();
  Future<Either<Failure, PeriodsEntity>> getPeriods({String? courseIdFilter, String? filterDate});
}