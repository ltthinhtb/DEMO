class PlayerProfile {
  String? playerName;
  String? playerRole;
  String? playerAvatar;
  String? playerClub;

  PlayerProfile(
      {this.playerName, this.playerRole, this.playerAvatar, this.playerClub});

  PlayerProfile.fromJson(Map<String, dynamic> json) {
    playerName = json['player_name'];
    playerRole = json['player_role'];
    playerAvatar = json['player_avatar'];
    playerClub = json['player_club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_name'] = this.playerName;
    data['player_role'] = this.playerRole;
    data['player_avatar'] = this.playerAvatar;
    data['player_club'] = this.playerClub;
    return data;
  }
}
