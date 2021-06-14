class TotalData {
  String? time;
  List<DataStats>? dataStats;
  List<PieStats>? pieStats;

  TotalData({this.time, this.dataStats, this.pieStats});

  TotalData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    if (json['data_stats'] != null) {
      dataStats = <DataStats>[];
      json['data_stats'].forEach((v) {
        dataStats!.add(new DataStats.fromJson(v));
      });
    }
    if (json['pie_stats'] != null) {
      pieStats = <PieStats>[];
      json['pie_stats'].forEach((v) {
        pieStats!.add(new PieStats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    if (this.dataStats != null) {
      data['data_stats'] = this.dataStats!.map((v) => v.toJson()).toList();
    }
    if (this.pieStats != null) {
      data['pie_stats'] = this.pieStats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataStats {
  String? title;
  double? yourValue;
  double? avgValue;
  List<IndexValue>? indexValue;

  DataStats({this.title, this.yourValue, this.avgValue, this.indexValue});

  DataStats.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    yourValue = json['your_value'];
    avgValue = json['avg_value'];
    if (json['index_value'] != null) {
      indexValue = <IndexValue>[];
      json['index_value'].forEach((v) {
        indexValue!.add(new IndexValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['your_value'] = this.yourValue;
    data['avg_value'] = this.avgValue;
    if (this.indexValue != null) {
      data['index_value'] = this.indexValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IndexValue {
  String? title;
  double? value;

  IndexValue({this.title, this.value});

  IndexValue.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

class PieStats {
  String? title;
  List<Chart>? chart;

  PieStats({this.title, this.chart});

  PieStats.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['chart'] != null) {
      chart = <Chart>[];
      json['chart'].forEach((v) {
        chart!.add(new Chart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chart {
  String? chartItem;
  double? chartValue;

  Chart({this.chartItem, this.chartValue});

  Chart.fromJson(Map<String, dynamic> json) {
    chartItem = json['chart_item'];
    chartValue = json['chart_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chart_item'] = this.chartItem;
    data['chart_value'] = this.chartValue;
    return data;
  }
}
