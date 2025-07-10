import 'package:clean_arch_app/features/instructor/domain/entities/periods_entity.dart';

class Periods extends PeriodsEntity{

Periods({super.periods, super.attendanceConfig});

factory Periods.fromJson(Map<String, dynamic> json) {
  return Periods(
    periods: json['periods'] != null ? (json['periods'] as List).map((e) => PeriodsModel.fromJson(e)).toList() : null,
    attendanceConfig: json['attendanceConfig'] != null ? AttendanceConfig.fromJson(json['attendanceConfig']) : null,
  );
}

Map<String, dynamic> toJson() {
  return {
    'periods': periods?.map((e) => e.toJson()).toList(),
    'attendanceConfig': attendanceConfig?.toJson(),
  };
}

}

class PeriodsModel {
  String? periodId;
  String? courseName;
  String? chapterName;
  String? instructorName;
  String? startTime;
  String? endTime;
  String? checkinGracePeriodStartedAt;
  int? checkinGracePeriodDuration;
  String? checkoutGracePeriodStartedAt;
  int? checkoutGracePeriodDuration;
  String? status;
  ActionButtons? actionButtons;
  // GracePeriodStatus? gracePeriodStatus;

  PeriodsModel({
    this.periodId,
    this.courseName,
    this.chapterName,
    this.instructorName,
    this.startTime,
    this.endTime,
    this.checkinGracePeriodStartedAt,
    this.checkinGracePeriodDuration,
    this.checkoutGracePeriodStartedAt,
    this.checkoutGracePeriodDuration,
    this.status,
    this.actionButtons,
    // this.gracePeriodStatus,
  });

  factory PeriodsModel.fromJson(Map<String, dynamic> json) {
    return PeriodsModel(
      periodId: json['periodId'],
      courseName: json['courseName'],
      chapterName: json['chapterName'],
      instructorName: json['instructorName'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      checkinGracePeriodStartedAt: json['checkinGracePeriodStartedAt'],
      checkinGracePeriodDuration: json['checkinGracePeriodDuration'],
      checkoutGracePeriodStartedAt: json['checkoutGracePeriodStartedAt'],
      checkoutGracePeriodDuration: json['checkoutGracePeriodDuration'],
      status: json['status'],
      actionButtons: json['actionButtons'] != null ? ActionButtons.fromJson(json['actionButtons']) : null,
      // gracePeriodStatus: json['gracePeriodStatus'] != null ? GracePeriodStatus.fromJson(json['gracePeriodStatus']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'periodId': periodId,
      'courseName': courseName,
      'chapterName': chapterName,
      'instructorName': instructorName,
      'startTime': startTime,
      'endTime': endTime,
      'checkinGracePeriodStartedAt': checkinGracePeriodStartedAt,
      'checkinGracePeriodDuration': checkinGracePeriodDuration,
      'checkoutGracePeriodStartedAt': checkoutGracePeriodStartedAt,
      'checkoutGracePeriodDuration': checkoutGracePeriodDuration,
      'status': status,
      'actionButtons': actionButtons?.toJson(),
      // 'gracePeriodStatus': gracePeriodStatus?.toJson(),
    };
  }
}

class ActionButtons {
  String? enableCheckInsButton;
  String? managePeriodButton;

  ActionButtons({
    this.enableCheckInsButton,
    this.managePeriodButton,
  });

  factory ActionButtons.fromJson(Map<String, dynamic> json) {
    return ActionButtons(
      enableCheckInsButton: json['enableCheckInsButton'],
      managePeriodButton: json['managePeriodButton'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enableCheckInsButton': enableCheckInsButton,
      'managePeriodButton': managePeriodButton,
    };
  }
}

class GracePeriodStatus {
  String? periodId;
  bool? isActive;
  String? startedAt;
  String? expiresAt;
  int? durationMinutes;
  String? startedBy;

  GracePeriodStatus({
    this.periodId,
    this.isActive,
    this.startedAt,
    this.expiresAt,
    this.durationMinutes,
    this.startedBy,
  });

  factory GracePeriodStatus.fromJson(Map<String, dynamic> json) {
    return GracePeriodStatus(
      periodId: json['periodId'],
      isActive: json['isActive'],
      startedAt: json['startedAt'],
      expiresAt: json['expiresAt'],
      durationMinutes: json['durationMinutes'],
      startedBy: json['startedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'periodId': periodId,
      'isActive': isActive,
      'startedAt': startedAt,
      'expiresAt': expiresAt,
      'durationMinutes': durationMinutes,
      'startedBy': startedBy,
    };
  }
}

class AttendanceConfig {
  int? gracePeriodBeforePeriodStartForCheckIn;
  int? gracePeriodAfterPeriodStartForCheckIn;
  int? gracePeriodAfterPeriodEndForCheckOut;
  int? gracePeriodUntilInstructorCheckExceeded;
  int? stopAcceptingQRCodeAfterBeginning;
  bool? qrCodeRequiredForCheckOut;
  bool? alertInstructorIfPeriodExceededForSubmitting;

  AttendanceConfig({
    this.gracePeriodBeforePeriodStartForCheckIn,
    this.gracePeriodAfterPeriodStartForCheckIn,
    this.gracePeriodAfterPeriodEndForCheckOut,
    this.gracePeriodUntilInstructorCheckExceeded,
    this.stopAcceptingQRCodeAfterBeginning,
    this.qrCodeRequiredForCheckOut,
    this.alertInstructorIfPeriodExceededForSubmitting,
  });

  factory AttendanceConfig.fromJson(Map<String, dynamic> json) {
    return AttendanceConfig(
      gracePeriodBeforePeriodStartForCheckIn: json['gracePeriodBeforePeriodStartForCheckIn'],
      gracePeriodAfterPeriodStartForCheckIn: json['gracePeriodAfterPeriodStartForCheckIn'],
      gracePeriodAfterPeriodEndForCheckOut: json['gracePeriodAfterPeriodEndForCheckOut'],
      gracePeriodUntilInstructorCheckExceeded: json['gracePeriodUntilInstructorCheckExceeded'],
      stopAcceptingQRCodeAfterBeginning: json['stopAcceptingQRCodeAfterBeginning'],
      qrCodeRequiredForCheckOut: json['qrCodeRequiredForCheckOut'],
      alertInstructorIfPeriodExceededForSubmitting: json['alertInstructorIfPeriodExceededForSubmitting'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gracePeriodBeforePeriodStartForCheckIn': gracePeriodBeforePeriodStartForCheckIn,
      'gracePeriodAfterPeriodStartForCheckIn': gracePeriodAfterPeriodStartForCheckIn,
      'gracePeriodAfterPeriodEndForCheckOut': gracePeriodAfterPeriodEndForCheckOut,
      'gracePeriodUntilInstructorCheckExceeded': gracePeriodUntilInstructorCheckExceeded,
      'stopAcceptingQRCodeAfterBeginning': stopAcceptingQRCodeAfterBeginning,
      'qrCodeRequiredForCheckOut': qrCodeRequiredForCheckOut,
      'alertInstructorIfPeriodExceededForSubmitting': alertInstructorIfPeriodExceededForSubmitting,
    };
  }
}