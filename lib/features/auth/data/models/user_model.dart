import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  User? user;

  UserModel({
    this.user, 
    required super.refreshToken, 
    required super.accessToken,
    required super.firstName,
    required super.familyName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userObj = json['user'] != null ? User.fromJson(json['user']) : null;
    
    return UserModel(
      user: userObj,
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      firstName: userObj!.firstName!,
      familyName: userObj.familyName!,
      email: userObj.email!,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class User {
  String? sId;
  String? title;
  String? nationality;
  String? nationalId;
  String? nationalIdImage;
  String? address;
  String? phoneNumber;
  EmployerInfo? employerInfo;
  String? emergencyPhoneNumber;
  Role? role;
  List<dynamic>? secondaryRoles;
  String? status;
  dynamic trainee;
  TrainingManager? trainingManager;
  Instructor? instructor;
  Invigilator? invigilator;
  AccountableManager? accountableManager;
  QualityManager? qualityManager;
  ExaminationManager? examinationManager;
  Examiner? examiner;
  PracticalAssessor? practicalAssessor;
  CertificationAuthority? certificationAuthority;
  Auditor? auditor;
  Admin? admin;
  CreatedBy? createdBy;
  List<dynamic>? reviewedBy;
  bool? backup;
  String? profilePicture;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? familyName;
  String? email;

  User({
    this.firstName,
    this.familyName,
    this.email,
    this.sId,
    this.title,
    this.nationality,
    this.nationalId,
    this.nationalIdImage,
    this.address,
    this.phoneNumber,
    this.employerInfo,
    this.emergencyPhoneNumber,
    this.role,
    this.secondaryRoles,
    this.status,
    this.trainee,
    this.trainingManager,
    this.instructor,
    this.invigilator,
    this.accountableManager,
    this.qualityManager,
    this.examinationManager,
    this.examiner,
    this.practicalAssessor,
    this.certificationAuthority,
    this.auditor,
    this.admin,
    this.createdBy,
    this.reviewedBy,
    this.backup,
    this.profilePicture,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sId: json['_id'],
      firstName: json['firstName'],
      familyName: json['familyName'],
      title: json['title'],
      nationality: json['nationality'],
      nationalId: json['nationalId'],
      nationalIdImage: json['nationalIdImage'],
      address: json['address'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      employerInfo: json['employerInfo'] != null ? EmployerInfo.fromJson(json['employerInfo']) : null,
      emergencyPhoneNumber: json['emergencyPhoneNumber'],
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      secondaryRoles: json['secondaryRoles'] != null ? List<dynamic>.from(json['secondaryRoles']) : null,
      status: json['status'],
      trainee: json['trainee'],
      trainingManager: json['trainingManager'] != null ? TrainingManager.fromJson(json['trainingManager']) : null,
      instructor: json['instructor'] != null ? Instructor.fromJson(json['instructor']) : null,
      invigilator: json['invigilator'] != null ? Invigilator.fromJson(json['invigilator']) : null,
      accountableManager: json['accountableManager'] != null ? AccountableManager.fromJson(json['accountableManager']) : null,
      qualityManager: json['qualityManager'] != null ? QualityManager.fromJson(json['qualityManager']) : null,
      examinationManager: json['examinationManager'] != null ? ExaminationManager.fromJson(json['examinationManager']) : null,
      examiner: json['examiner'] != null ? Examiner.fromJson(json['examiner']) : null,
      practicalAssessor: json['practicalAssessor'] != null ? PracticalAssessor.fromJson(json['practicalAssessor']) : null,
      certificationAuthority: json['certificationAuthority'] != null ? CertificationAuthority.fromJson(json['certificationAuthority']) : null,
      auditor: json['auditor'] != null ? Auditor.fromJson(json['auditor']) : null,
      admin: json['admin'] != null ? Admin.fromJson(json['admin']) : null,
      createdBy: json['createdBy'] != null ? CreatedBy.fromJson(json['createdBy']) : null,
      reviewedBy: json['reviewedBy'] != null ? List<dynamic>.from(json['reviewedBy']) : null,
      backup: json['backup'],
      profilePicture: json['profilePicture'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['familyName'] = familyName;
    data['title'] = title;
    data['nationality'] = nationality;
    data['nationalId'] = nationalId;
    data['nationalIdImage'] = nationalIdImage;
    data['address'] = address;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    if (employerInfo != null) {
      data['employerInfo'] = employerInfo!.toJson();
    }
    data['emergencyPhoneNumber'] = emergencyPhoneNumber;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (secondaryRoles != null) {
      data['secondaryRoles'] = secondaryRoles!.map((v) => v.toString()).toList();
    }
    data['status'] = status;
    data['trainee'] = trainee;
    if (trainingManager != null) {
      data['trainingManager'] = trainingManager!.toJson();
    }
    if (instructor != null) {
      data['instructor'] = instructor!.toJson();
    }
    if (invigilator != null) {
      data['invigilator'] = invigilator!.toJson();
    }
    if (accountableManager != null) {
      data['accountableManager'] = accountableManager!.toJson();
    }
    if (qualityManager != null) {
      data['qualityManager'] = qualityManager!.toJson();
    }
    if (examinationManager != null) {
      data['examinationManager'] = examinationManager!.toJson();
    }
    if (examiner != null) {
      data['examiner'] = examiner!.toJson();
    }
    if (practicalAssessor != null) {
      data['practicalAssessor'] = practicalAssessor!.toJson();
    }
    if (certificationAuthority != null) {
      data['certificationAuthority'] = certificationAuthority!.toJson();
    }
    if (auditor != null) {
      data['auditor'] = auditor!.toJson();
    }
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    if (reviewedBy != null) {
      data['reviewedBy'] = reviewedBy!.map((v) => v.toString()).toList();
    }
    data['backup'] = backup;
    data['profilePicture'] = profilePicture;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class EmployerInfo {
  String? country;
  String? companyName;
  String? companyAddress;
  String? title;

  EmployerInfo({this.country, this.companyName, this.companyAddress, this.title});

  factory EmployerInfo.fromJson(Map<String, dynamic> json) {
    return EmployerInfo(
      country: json['country'],
      companyName: json['companyName'],
      companyAddress: json['companyAddress'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['companyName'] = companyName;
    data['companyAddress'] = companyAddress;
    data['title'] = title;
    return data;
  }
}

class Role {
  String? sId;
  String? code;
  String? name;

  Role({this.sId, this.code, this.name});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      sId: json['_id'],
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class TrainingManager {
  String? sId;
  String? name;

  TrainingManager({this.sId, this.name});

  factory TrainingManager.fromJson(Map<String, dynamic> json) {
    return TrainingManager(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Instructor {
  String? sId;
  String? name;

  Instructor({this.sId, this.name});

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Invigilator {
  String? sId;
  String? name;

  Invigilator({this.sId, this.name});

  factory Invigilator.fromJson(Map<String, dynamic> json) {
    return Invigilator(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class AccountableManager {
  String? sId;
  String? name;

  AccountableManager({this.sId, this.name});

  factory AccountableManager.fromJson(Map<String, dynamic> json) {
    return AccountableManager(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class QualityManager {
  String? sId;
  String? name;

  QualityManager({this.sId, this.name});

  factory QualityManager.fromJson(Map<String, dynamic> json) {
    return QualityManager(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class ExaminationManager {
  String? sId;
  String? name;

  ExaminationManager({this.sId, this.name});

  factory ExaminationManager.fromJson(Map<String, dynamic> json) {
    return ExaminationManager(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Examiner {
  String? sId;
  String? name;

  Examiner({this.sId, this.name});

  factory Examiner.fromJson(Map<String, dynamic> json) {
    return Examiner(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class PracticalAssessor {
  String? sId;
  String? name;

  PracticalAssessor({this.sId, this.name});

  factory PracticalAssessor.fromJson(Map<String, dynamic> json) {
    return PracticalAssessor(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class CertificationAuthority {
  String? sId;
  String? name;

  CertificationAuthority({this.sId, this.name});

  factory CertificationAuthority.fromJson(Map<String, dynamic> json) {
    return CertificationAuthority(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Auditor {
  String? sId;
  String? name;

  Auditor({this.sId, this.name});

  factory Auditor.fromJson(Map<String, dynamic> json) {
    return Auditor(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Admin {
  String? sId;
  String? name;

  Admin({this.sId, this.name});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class CreatedBy {
  String? sId;
  String? name;

  CreatedBy({this.sId, this.name});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      sId: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}


// class UserModel extends UserEntity {
//   final String id;  
//   UserModel({required super.name, required super.email, required super.accessToken, required this.id});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(name: json['name'], email: json['email'], accessToken: json['accessToken'], id: json['_id']);
//   }
// }