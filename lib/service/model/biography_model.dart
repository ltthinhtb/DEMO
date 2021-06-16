class BiographyModel {
  String? name;
  String? nickName;
  String? avatar;
  String? position;
  int? age;
  String? clubLogo;
  String? countryLogo;
  String? education;
  String? level;
  int? friends;
  int? fans;
  int? follow;
  String? introduce;

  BiographyModel(
      {this.name,
        this.nickName,
        this.avatar,
        this.position,
        this.age,
        this.clubLogo,
        this.countryLogo,
        this.education,
        this.level,
        this.friends,
        this.fans,
        this.follow,
        this.introduce}) ;

  BiographyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nickName = json['nick_name'];
    avatar = json['avatar'];
    position = json['position'];
    age = json['age'];
    clubLogo = json['club_logo'];
    countryLogo = json['country_logo'];
    education = json['education'];
    level = json['level'];
    friends = json['friends'];
    fans = json['fans'];
    follow = json['follow'];
    introduce = json['introduce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nick_name'] = this.nickName;
    data['avatar'] = this.avatar;
    data['position'] = this.position;
    data['age'] = this.age;
    data['club_logo'] = this.clubLogo;
    data['country_logo'] = this.countryLogo;
    data['education'] = this.education;
    data['level'] = this.level;
    data['friends'] = this.friends;
    data['fans'] = this.fans;
    data['follow'] = this.follow;
    data['introduce'] = this.introduce;
    return data;
  }
}
