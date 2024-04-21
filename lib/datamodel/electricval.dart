class MeterData {
  String datae;
  String Edate;
  String type;

  MeterData({
    required this.datae,
    required this.Edate,
    required this.type,
  });

  MeterData.formJson(Map<String, Object?> json)
      : this(
            datae: json['data']! as String,
            Edate: json['date']! as String,
            type: json['type']! as String);

  Map<String, Object> toJson() {
    return {'data': datae, 'date': Edate, 'type': type};
  }
}
