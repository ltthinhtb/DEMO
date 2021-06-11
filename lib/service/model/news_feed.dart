class NewsFeed {
  String? userAvatar;
  String? userName;
  String? address;
  String? timeAgo;
  List<News>? data;

  NewsFeed(
      {this.userAvatar, this.userName, this.address, this.timeAgo, this.data});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    userAvatar = json['user_avatar'];
    userName = json['user_name'];
    address = json['address'];
    timeAgo = json['time_ago'];
    if (json['data'] != null) {
      data = <News>[];
      json['data'].forEach((v) {
        data!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_avatar'] = this.userAvatar;
    data['user_name'] = this.userName;
    data['address'] = this.address;
    data['time_ago'] = this.timeAgo;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? type;
  Training? training;
  String? describe;
  int? feeling;
  int? comment;
  Match? match;

  News(
      {this.type,
      this.training,
      this.describe,
      this.feeling,
      this.comment,
      this.match});

  News.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    training = json['training'] != null
        ? new Training.fromJson(json['training'])
        : null;
    describe = json['describe'];
    feeling = json['feeling'];
    comment = json['comment'];
    match = json['match'] != null ? new Match.fromJson(json['match']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.training != null) {
      data['training'] = this.training!.toJson();
    }
    data['describe'] = this.describe;
    data['feeling'] = this.feeling;
    data['comment'] = this.comment;
    if (this.match != null) {
      data['match'] = this.match!.toJson();
    }
    return data;
  }
}

class Training {
  String? totalTime;
  String? timeTraning;
  List<Chart>? chart;

  Training({this.totalTime, this.timeTraning, this.chart});

  Training.fromJson(Map<String, dynamic> json) {
    totalTime = json['total_time'];
    timeTraning = json['time_traning'];
    if (json['chart'] != null) {
      chart = <Chart>[];
      json['chart'].forEach((v) {
        chart!.add(new Chart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_time'] = this.totalTime;
    data['time_traning'] = this.timeTraning;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chart {
  String? time;
  String? chartItem;
  double? percent;

  Chart({this.time, this.chartItem, this.percent});

  Chart.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    chartItem = json['chart_item'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['chart_item'] = this.chartItem;
    data['percent'] = this.percent;
    return data;
  }
}

class Match {
  String? dateTime;
  String? season;
  List<MatchStats>? matchStats;
  Team? team1;
  Team? team2;

  Match({this.dateTime, this.season, this.matchStats, this.team1, this.team2});

  Match.fromJson(Map<String, dynamic> json) {
    dateTime = json['date_time'];
    season = json['season'];
    if (json['match_stats'] != null) {
      matchStats = <MatchStats>[];
      json['match_stats'].forEach((v) {
        matchStats!.add(new MatchStats.fromJson(v));
      });
    }
    team1 = json['team1'] != null ? new Team.fromJson(json['team1']) : null;
    team2 = json['team2'] != null ? new Team.fromJson(json['team2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_time'] = this.dateTime;
    data['season'] = this.season;
    if (this.matchStats != null) {
      data['match_stats'] = this.matchStats!.map((v) => v.toJson()).toList();
    }
    if (this.team1 != null) {
      data['team1'] = this.team1!.toJson();
    }
    if (this.team2 != null) {
      data['team2'] = this.team2!.toJson();
    }
    return data;
  }
}

class MatchStats {
  String? stats;
  String? value;

  MatchStats({this.stats, this.value});

  MatchStats.fromJson(Map<String, dynamic> json) {
    stats = json['stats'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stats'] = this.stats;
    data['value'] = this.value;
    return data;
  }
}

class Team {
  int? score;
  String? teamClub;
  String? teamLogo;

  Team({this.score, this.teamClub, this.teamLogo});

  Team.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    teamClub = json['team_club'];
    teamLogo = json['team_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['team_club'] = this.teamClub;
    data['team_logo'] = this.teamLogo;
    return data;
  }
}
