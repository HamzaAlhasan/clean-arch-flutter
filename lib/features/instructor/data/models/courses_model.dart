import 'package:clean_arch_app/features/instructor/domain/entities/courses_entity.dart';

class CoursesModel extends CoursesEntity {
  CoursesModel({super.availableCourses});

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      availableCourses: json['availableCourses'] != null
          ? (json['availableCourses'] as List)
              .map((e) => AvailableCourses.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availableCourses': availableCourses?.map((e) => e.toJson()).toList(),
    };
  }
}