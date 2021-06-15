class PracticeRow {
  String? type;
  double? sec;
  double? secAvg;
  double? hour;
  double? hourAvg;

  PracticeRow({this.type, this.sec, this.secAvg, this.hour, this.hourAvg});

  PracticeRow.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sec = json['sec'];
    secAvg = json['sec_avg'];
    hour = json['hour'];
    hourAvg = json['hour_avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sec'] = this.sec;
    data['sec_avg'] = this.secAvg;
    data['hour'] = this.hour;
    data['hour_avg'] = this.hourAvg;
    return data;
  }
}
