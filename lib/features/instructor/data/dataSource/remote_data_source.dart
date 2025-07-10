import 'package:clean_arch_app/core/api/api_consumer.dart';
import 'package:clean_arch_app/core/api/api_keys.dart';
import 'package:clean_arch_app/core/api/end_pionts.dart';
import 'package:clean_arch_app/features/instructor/data/models/courses_model.dart';
import 'package:clean_arch_app/features/instructor/data/models/periods_model.dart';

class InstructorRemoteDataSource {
  final ApiConsumer apiConsumer;

  InstructorRemoteDataSource({required this.apiConsumer});

  Future<CoursesModel?> getCourses() async {
      final response = await apiConsumer.get(EndPoints.courses);
      return CoursesModel.fromJson(response);
  }

  Future<Periods?> getPeriods({String? courseIdFilter, String? filterDate}) async {
      final Map<String, dynamic> queryParams = {};
      if (courseIdFilter != null) {
        queryParams[ApiKeys.courseIdFilter] = courseIdFilter;
      }
      if (filterDate != null) {
        queryParams[ApiKeys.filterDate] = filterDate;
      }
      
      final response = await apiConsumer.get(EndPoints.periods, queryParameters: queryParams);
      return Periods.fromJson(response);
  }
}