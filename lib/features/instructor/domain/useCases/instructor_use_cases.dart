import 'package:clean_arch_app/core/errors/failure.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/courses_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/periods_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/repositories/instructor_repostory.dart';
import 'package:dartz/dartz.dart';

class InstructorUseCase {
  final InstructorRepository instructorRepository;

  InstructorUseCase({required this.instructorRepository});

    Future<Either<Failure, CoursesEntity>> callGetCourses() {
      return instructorRepository.getCourses();
    }

    Future<Either<Failure, PeriodsEntity>> callGetPeriods({String? courseIdFilter, String? filterDate}) {
      return instructorRepository.getPeriods(courseIdFilter: courseIdFilter, filterDate: filterDate);
    }
}