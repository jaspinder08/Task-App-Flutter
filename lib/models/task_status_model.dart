import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TaskStatusModel {
  final String id;
  final String name;
  final String icon;
  final Color color;
  final String pendingTask;

  TaskStatusModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.pendingTask,
  });

  factory TaskStatusModel.fromJson(Map<String, dynamic> json) {
    return TaskStatusModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      color:
          Color(int.parse(json['color'].substring(1), radix: 16) + 0xFF000000),
      pendingTask: json['pendingTask'],
    );
  }

  static Future<List<TaskStatusModel>> loadTaskStatuses() async {
    final String jsonString =
        await rootBundle.loadString('lib/data/task_status.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> taskStatusesJson = jsonData['taskStatuses'];

    return taskStatusesJson
        .map((json) => TaskStatusModel.fromJson(json))
        .toList();
  }
}
