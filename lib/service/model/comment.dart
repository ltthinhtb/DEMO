class Comment {
  String? user;
  String? avatar;
  String? timeAge;
  bool? yourLike;
  String? comment;

  Comment({this.user, this.avatar, this.timeAge, this.yourLike, this.comment});

  Comment.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    avatar = json['avatar'];
    timeAge = json['time_age'];
    yourLike = json['your_like'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['avatar'] = this.avatar;
    data['time_age'] = this.timeAge;
    data['your_like'] = this.yourLike;
    data['comment'] = this.comment;
    return data;
  }
}
