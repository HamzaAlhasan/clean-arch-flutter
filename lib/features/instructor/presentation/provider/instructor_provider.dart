import 'dart:developer';

import 'package:clean_arch_app/core/shared/widgets/custom_alert.dart';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/core/utilities/shared_prefrences_helper.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_app/features/auth/presentation/pages/home_page.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/courses_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/entities/periods_entity.dart';
import 'package:clean_arch_app/features/instructor/domain/useCases/instructor_use_cases.dart';
import 'package:flutter/material.dart';

class InstructorProvider extends ChangeNotifier {
  final InstructorUseCase instructorUseCase;

  InstructorProvider({required this.instructorUseCase});

  bool _isLoading = false;
  bool _isPeriodsLoading = false;
  String? _errorMessage;
  CoursesEntity? _courses;
  PeriodsEntity? _periods;
  String? _selectedCourseId;
  String? _selectedDate;

  bool get isLoading => _isLoading;
  bool get isPeriodsLoading => _isPeriodsLoading;
  String? get errorMessage => _errorMessage;
  CoursesEntity? get courses => _courses;
  PeriodsEntity? get periods => _periods;
  String? get selectedCourseId => _selectedCourseId;
  String? get selectedDate => _selectedDate;
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setPeriodsLoading(bool loading) {
    _isPeriodsLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setCourses(CoursesEntity courses) {
    _courses = courses;
    notifyListeners();
  }

  void _setPeriods(PeriodsEntity periods) {
    _periods = periods;
    notifyListeners();
  }

  void setSelectedCourseId(String courseId) {
    _selectedCourseId = courseId;
    notifyListeners();
  }

  void setSelectedDate(String date) {
    _selectedDate = date;
    notifyListeners();
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(title: message, actionText: "OK"),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  
  Future<void> getCourses(BuildContext context) async {
    _setLoading(true);
    _clearError();
    final result = await instructorUseCase.callGetCourses();
    
    result.fold(
      (failure) {
        _setLoading(false);
        _setError(failure.message);
        _showErrorDialog(context, failure.message);
      }, 
      (courses) {
        _setLoading(false);
        log("hamza is ${courses.availableCourses?.map((e)=>e.toJson())}");
        _setCourses(courses);
      }
    );
  }


  Future<void> getPeriods(BuildContext context, {String? courseIdFilter, String? filterDate}) async {
    _setPeriodsLoading(true);
    _clearError();
    final result = await instructorUseCase.callGetPeriods(courseIdFilter: courseIdFilter, filterDate: filterDate);
    
    result.fold(
      (failure) {
        _setPeriodsLoading(false);
        _setError(failure.message);
        _showErrorDialog(context, failure.message);
      }, 
      (courses) {
        _setPeriodsLoading(false);
        log("hamza is ${courses.periods?.map((e)=>e.toJson())}");
        _setPeriods(courses);
      }
    );
  }


}