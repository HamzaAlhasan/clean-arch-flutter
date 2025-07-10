import 'package:clean_arch_app/features/instructor/data/models/periods_model.dart';

class PeriodsEntity {
  final List<PeriodsModel>? periods;
  final AttendanceConfig? attendanceConfig;

  PeriodsEntity({this.periods, this.attendanceConfig});

}