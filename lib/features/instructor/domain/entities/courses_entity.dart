class CoursesEntity {
  List<AvailableCourses>? availableCourses;

  CoursesEntity({this.availableCourses});

  CoursesEntity.fromJson(Map<String, dynamic> json) {
    if (json['availableCourses'] != null) {
      availableCourses = <AvailableCourses>[];
      json['availableCourses'].forEach((v) {
        availableCourses!.add(new AvailableCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.availableCourses != null) {
      data['availableCourses'] =
          this.availableCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableCourses {
  String? id;
  String? name;

  AvailableCourses({this.id, this.name});

  AvailableCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}