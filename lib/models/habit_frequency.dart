class HabitFrequency{
  String id;
  String strDay;
  double percentage;


  HabitFrequency(
      {
    required this.id, required this.strDay,
    required this.percentage,
    }
  );

  factory HabitFrequency.fromJson(Map<String, dynamic> json) => HabitFrequency(
    id: json["id"],
    strDay: json["strDay"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "strDay": strDay,
    "percentage": percentage,
  };
}