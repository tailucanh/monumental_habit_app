import 'package:flutter/material.dart';

class ProgressTimeProfile{
  String id;
  String strTime;
  double totalTask;
  Color color;

  ProgressTimeProfile(
      {
    required this.id, required this.strTime,
    required this.totalTask,
    required this.color,
    }
  );

  factory ProgressTimeProfile.fromJson(Map<String, dynamic> json) => ProgressTimeProfile(
    id: json["id"],
    strTime: json["strTime"],
    totalTask: json["totalTask"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "strTime": strTime,
    "totalTask": totalTask,
    "color": color,
  };
}